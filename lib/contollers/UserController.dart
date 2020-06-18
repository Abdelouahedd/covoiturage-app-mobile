import 'dart:io';

import 'package:covoiturage_app/models/User.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class UserController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User _user;
  UserController({User user}) : _user = user;

  Future signIn(String email, String password) async {
    try {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) => this.getUser(value.user.uid))
          .timeout(new Duration(seconds: 60))
          .catchError(
            (onError) =>
                print("Error while sign in to app :${onError.message}"),
          );
      return _user;
    } catch (e) {
      print("Error while sign in to app :${e.message}");
      return null;
    }
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
                .catchError((onError) => {
                      print(
                          "Error while add new user to document : ${onError.code}"),
                      returnVal = false,
                    }),
          });
      returnVal = true;
    } catch (e) {
      print("Error while sign up to app :${e.message}");
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
    try {
      await _auth.signOut();
      print("Success log out");
      return true;
    } catch (err) {
      print("Error while user sign out  : ${err.message}");
      return false;
    }
  }

  void getUser(String uid) {
    Firestore.instance
        .collection("users")
        .document(uid)
        .get()
        .then((value) => {
              print("returned value ${value.data}"),
              _user = User.fromJson(value.data),
              print("Returned user ${_user.toString()}")
            })
        .catchError((onError) =>
            print("Error while getting information of user  : $onError"));
  }

  User buildUser(Map<String, dynamic> json) {
    return User(
      id: json["id"],
      username: json["username"],
      email: json["email"],
      password: json["password"],
      city: json["city"],
      birthDay: Util.convertToDateTime(json["birthDay"]),
      profileImg: json["profileImg"] == null ? null : json["profileImg"],
      rank: json["rank"],
    );
  }
}
