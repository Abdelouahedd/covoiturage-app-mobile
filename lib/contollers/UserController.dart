import 'dart:io';

import 'package:covoiturage_app/models/User.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final User _user;
  UserController(this._user);
  Future signIn() async {
    try {
      AuthResult result = await _auth.signInWithEmailAndPassword(
          email: _user.email, password: _user.password);
      FirebaseUser baseUser = result.user;
      return baseUser;
    } catch (e) {
      print("Error while sign in to app :${e.toString()}");
    }
    return null;
  }

  Future<dynamic> signUp(File avatarImageFile) async {
    bool returnVal = false;
    try {
      //create a user from email and password
      AuthResult result = await _auth.createUserWithEmailAndPassword(
          email: _user.email, password: _user.password);
      _user.setId(result.user.uid);
      //upload image avatre
      await this._uploadFile(avatarImageFile);
      //add username and photo to  FirebaseAuth
      UserUpdateInfo userUpdateInfo = new UserUpdateInfo();
      userUpdateInfo.displayName = _user.username;
      userUpdateInfo.photoUrl = _user.profileImg;

      await result.user.updateProfile(userUpdateInfo).then((value) => {
            //add user to Firebase FireStore
            Firestore.instance
                .collection("users")
                .document(_user.id)
                .setData(_user.toJson())
                .then((value) => returnVal = true)
                .catchError((onError) =>
                    print("Error while add new user to document : $onError")),
          });
    } catch (e) {
      print("Error while sign up to app :${e.toString()}");
      returnVal = false;
    }
    return returnVal;
  }

  Future _uploadFile(File avatarImageFile) async {
    String fileName = _user.id;
    if (avatarImageFile != null) {
      StorageReference reference =
          FirebaseStorage.instance.ref().child(fileName);
      StorageUploadTask uploadTask = reference.putFile(avatarImageFile);
      StorageTaskSnapshot storageTaskSnapshot;
      uploadTask.onComplete.then((value) {
        if (value.error == null) {
          storageTaskSnapshot = value;
          storageTaskSnapshot.ref.getDownloadURL().then((downloadUrl) {
            _user.profileImg = downloadUrl;
          }, onError: (err) {
            print("Error ${_user.profileImg}");
          });
        } else {
          print("Error ${_user.profileImg} is not img");
        }
      }, onError: (err) {
        print("Error : ${err.toString()}");
      });
    } else {
      _user.profileImg = "assets/images/user.png";
    }
  }

  Future<bool> signOut() async {
    _auth.signOut().then((value) {
      return true;
    }).catchError(
      (onError) => {
        print("Error while add new user to document : ${onError.toString()}"),
      },
    );
    return false;
  }
}
