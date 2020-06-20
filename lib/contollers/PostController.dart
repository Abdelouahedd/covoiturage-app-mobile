import 'dart:io';

import 'package:covoiturage_app/models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covoiturage_app/models/User.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:uuid/uuid.dart';

class PostController {
  final db = Firestore.instance;
  Post _post;
  var uuid = Uuid();

  PostController({Post post}) : _post = post;
  void setPost(Post p) => _post = p;

  Future<bool> createPost(File desc) async {
    bool returnVal = false;
    if (desc != null)
      await this.uploadFile(desc).then((value) => _post.imgDesc = value);
   
    await db
        .collection("posts")
        .document(_post.id)
        .setData(_post.toJson())
        .then((value) => returnVal = true)
        .catchError((onError) => {
              print("Error while add new post : ${onError.toString()}"),
              returnVal = false,
            });
    return returnVal;
  }

  Future<bool> updatePost() async {
    bool returnVal = false;
    await db
        .collection("posts")
        .document(_post.id)
        .updateData(_post.toJson())
        .then((value) => returnVal = true)
        .catchError((onError) => {
              print("Error while update  post ${_post.id} : ${onError.code}"),
              returnVal = false,
            });
    return returnVal;
  }

  Future<bool> deletePost() async {
    bool returnVal = false;
    await db
        .collection("posts")
        .document(_post.id)
        .delete()
        .then((value) => returnVal = true)
        .catchError((onError) => {
              print("Error while delete  post ${_post.id}  : ${onError.code}"),
              returnVal = false,
            });
    return returnVal;
  }

  Future<List<Post>> getAllPosts() async {
    List<Post> posts = new List();
    await db
        .collection("posts")
        .getDocuments()
        .then((value) =>
            posts = value.documents.map((p) => Post.fromJson(p.data)).toList())
        .catchError(
          (onError) =>
              print("Error while delete  post ${_post.id}  : ${onError.code}"),
        );
    return posts;
  }

  Future<List<Post>> getAllPostsUer(User user) async {
    List<Post> posts = new List();
    await db
        .collection("posts")
        .where("user.id", isEqualTo: user.id)
        .getDocuments()
        .then((value) =>
            posts = value.documents.map((p) => Post.fromJson(p.data)).toList())
        .catchError(
          (onError) =>
              print("Error while delete  post ${_post.id}  : ${onError.code}"),
        );
    return posts;
  }

  Future<String> uploadFile(File avatarImageFile) async {
    String imgPath;
    if (avatarImageFile != null) {
      String fileName = _post.id;
      StorageReference reference =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = reference.putFile(avatarImageFile);
      StorageTaskSnapshot storageTaskSnapshot;
      await uploadTask.onComplete.then((value) async {
        if (value.error == null) {
          storageTaskSnapshot = value;
          await storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
            imgPath = downloadUrl.toString();
          }, onError: (err) {
            print("Error ${avatarImageFile.path}");
          });
        } else {
          print("Error ${avatarImageFile.path} is not img");
        }
      }, onError: (err) {
        print("Error : ${err.toString()}");
      });
    }
    return imgPath;
  }
}
