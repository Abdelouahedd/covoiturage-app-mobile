import 'dart:io';

import 'package:covoiturage_app/models/Post.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covoiturage_app/models/User.dart';
import 'package:firebase_storage/firebase_storage.dart';

class PostController {
  final db = Firestore.instance;
  Post _post;
  PostController({Post post}) : _post = post;

  Future<bool> createPost(File desc) async {
    bool returnVal = false;
    try {
      this._uploadFile(desc);
    } catch (e) {
      print("Error while uploading image for post : ${e.code}");
    }
    await db
        .collection("posts")
        .add(_post.toJson())
        .then((value) => {
              print(value.documentID),
              returnVal = true,
            })
        .catchError((onError) => {
              print("Error while add new post : ${onError.code}"),
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

  Future _uploadFile(File avatarImageFile) async {
    String fileName = _post.id;
    StorageReference reference = FirebaseStorage.instance.ref().child(fileName);
    StorageUploadTask uploadTask = reference.putFile(avatarImageFile);
    StorageTaskSnapshot storageTaskSnapshot;
    uploadTask.onComplete.then((value) {
      if (value.error == null) {
        storageTaskSnapshot = value;
        storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
          _post.imgDesc = downloadUrl;
        }, onError: (err) {
          print("Error ${_post.imgDesc}");
        });
      } else {
        print("Error ${_post.imgDesc} is not img");
      }
    }, onError: (err) {
      print("Error : ${err.toString()}");
    });
  }
}
