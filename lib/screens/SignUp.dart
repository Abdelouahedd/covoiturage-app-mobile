import 'dart:io';

import 'package:covoiturage_app/contollers/UserController.dart';
import 'package:covoiturage_app/contollers/UserSession.dart';
import 'package:covoiturage_app/models/User.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:covoiturage_app/widgets/CustomTextField.dart';
import 'package:covoiturage_app/widgets/Input.dart';
import 'package:covoiturage_app/widgets/InputPassword.dart';
import 'package:covoiturage_app/widgets/MyButton.dart';
import 'package:covoiturage_app/widgets/animatedRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:getflutter/getflutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'SignIn.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _autoValidate = false;
  TextEditingController emailController;
  TextEditingController userController;
  TextEditingController passwordController;
  TextEditingController cityController;
  TextEditingController birthDayController;
  File _image;
  bool disable = false;
  bool isLoading = false;
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
      this._image = image;
    });
  }

  @override
  void initState() {
    super.initState();
    emailController = new TextEditingController();
    userController = new TextEditingController();
    passwordController = new TextEditingController();
    cityController = new TextEditingController();
    birthDayController = new TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    userController.dispose();
    passwordController.dispose();
    cityController.dispose();
    birthDayController.dispose();
  }

  void submit() {
    String email = emailController.text.trim();
    User user = new User(
      email: email,
      city: cityController.text,
      birthDay: Util.convertToDateTime(birthDayController.text),
      username: userController.text,
      password: passwordController.text,
    );
    print(
        "---------------------------------------------------------------- \n");
    print("password  : ${passwordController.text}");
    print("user from FORM  : $user");
    UserController controller = new UserController(user: user);
    File img = this._image;
    this.setState(() {
      isLoading = true;
    });
    controller.signUp(img).then((value) => {
          value == true
              ? Fluttertoast.showToast(
                  msg: "User created sucess", backgroundColor: Colors.green)
              : Fluttertoast.showToast(
                  msg: "Problem while creating user",
                  backgroundColor: Colors.red),
        });
       this.setState(() {
            isLoading = false;
          });
    print(
        "---------------------------------------------------------------- \n");
    Navigator.pushReplacement(context, ScaleRoute(page: SignIn()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidate: _autoValidate,
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)),
                                  border: Border.all(color: Colors.blue),
                                  color: Colors.white,
                                ),
                                child: new FlatButton(
                                  onPressed: null,
                                  child: Text(
                                    'SIGN UP',
                                    style: TextStyle(
                                        fontSize: 30.0, color: Colors.blue),
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
                            // new CustomTextField(
                            //   icon: Icon(Icons.perm_identity),
                            //   hint: "UserName",
                            //   validator: (v) {
                            //     Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+'
                            //         r'(\.[^<>()[\]\\.,;:\s@\"]+)*)|'
                            //         r'(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.'
                            //         r'[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)'
                            //         r'+[a-zA-Z]{2,}))$';
                            //     RegExp regex = new RegExp(pattern);
                            //     if (v.length == 0) return "* require";
                            //     if (!regex.hasMatch(v)) return 'Enter Valid Email';
                            //   },
                            //   onSaved: (newValue) => print(newValue),
                            // ),
                            Input("UserName", Icons.perm_identity, 0,
                                userController),
                            Input("Email", Icons.email, 10, emailController),
                            InputPassword(passwordController, 10),
                            Input("City", Icons.place, 10, cityController),
                            InkWell(
                              onTap: () => {this._selectDate(context)},
                              child: IgnorePointer(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width / 1.2,
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
                                            color: Colors.black12,
                                            blurRadius: 5)
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
                            MyButton(
                                "Sign up",
                                2,
                                () => {
                                      if (_formKey.currentState.validate())
                                        {
                                          submit(),
                                        }
                                      else
                                        {
                                          this.setState(() {
                                            _autoValidate = true;
                                          }),
                                          Fluttertoast.showToast(
                                              msg: "Form not completed",
                                              backgroundColor: Colors.red)
                                        }
                                    }),
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            child: isLoading
                ? Container(
                    child: Center(
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(
                              Theme.of(context).primaryColor)),
                    ),
                    color: Colors.white.withOpacity(0.8),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
