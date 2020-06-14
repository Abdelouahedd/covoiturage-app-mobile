import 'dart:io';

import 'package:covoiturage_app/widgets/Input.dart';
import 'package:covoiturage_app/widgets/InputPassword.dart';
import 'package:covoiturage_app/widgets/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  TextEditingController cityController = new TextEditingController();
  TextEditingController birthDayController = new TextEditingController();
  File _image;

  DateTime selectedDate = DateTime.now();

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900, 1),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        birthDayController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height / 2.5,
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: new BoxDecoration(
                      color: Colors.blue[350],
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue[400],
                          Colors.blue[300],
                          Colors.blue[200],
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: 60,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 100,
                          decoration: new BoxDecoration(
                            border: Border.all(color: Colors.blue),
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: _image == null
                              ? new FlatButton(
                                  onPressed: this.getImage,
                                  child: Icon(
                                    Icons.add_photo_alternate,
                                    color: Colors.blue[500],
                                    size: 30,
                                  ),
                                )
                              : GFImageOverlay(
                                  boxFit: BoxFit.cover,
                                  shape: BoxShape.circle,
                                  image: Image.file(_image).image,
                                ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 180,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 2,
                          height: 60,
                          decoration: new BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.blue),
                            color: Colors.white,
                          ),
                          child: new FlatButton(
                            onPressed: null,
                            child: Text(
                              'SIGN UP',
                              style:
                                  TextStyle(fontSize: 30.0, color: Colors.blue),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Input("UserName", Icons.perm_identity, 0, userController),
                      InputPassword(passwordController, 10),
                      Input("Email", Icons.email, 10, emailController),
                      Input("City", Icons.place, 10, cityController),
                      InkWell(
                        onTap: () => {this._selectDate(context)},
                        child: IgnorePointer(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.2,
                            height: 45,
                            margin: EdgeInsets.only(top: 10),
                            padding: EdgeInsets.only(
                                top: 4, left: 16, right: 16, bottom: 4),
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12, blurRadius: 5)
                                ]),
                            child: TextField(
                              readOnly: true,
                              controller: birthDayController,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                icon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.blue[600],
                                ),
                                hintText: "Birth day",
                                hintStyle: TextStyle(color: Colors.blue),
                              ),
                              style: TextStyle(color: Colors.blue[700]),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      MyButton("Sign up", 2, () => {print("Sign Up")}),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
