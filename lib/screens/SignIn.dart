import 'package:covoiturage_app/contollers/UserController.dart';
import 'package:covoiturage_app/contollers/UserSession.dart';
import 'package:covoiturage_app/models/User.dart';
import 'package:covoiturage_app/screens/ControllerScreens.dart';
import 'package:covoiturage_app/screens/SignUp.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:covoiturage_app/widgets/Input.dart';
import 'package:covoiturage_app/widgets/InputPassword.dart';
import 'package:covoiturage_app/widgets/MyButton.dart';
import 'package:covoiturage_app/widgets/animatedRoute.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:getflutter/components/alert/gf_alert.dart';
import 'package:getflutter/getflutter.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String image = "";

  bool isLoading = false;
  UserSession userSession = new UserSession();
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  void signUp() {
    Navigator.push(context, SlideRightRoute(page: SignUp()));
  }

  void signIn() {
    String email = emailController.text.trim();
    String pass = Util.hashPass(passwordController.text);
    User user = new User(email: email, password: pass);
    UserController controller = new UserController(user: user);
    this.setState(() {
      isLoading = true;
    });
    controller.signIn(email, pass).then((value) => {
          print("value $value"),
          if (value == null)
            {
              this.setState(() {
                isLoading = false;
              }),
              Fluttertoast.showToast(
                  msg: "User not found", backgroundColor: Colors.red),
            }
          else
            {
              this.setState(() {
                isLoading = false;
              }),
              Fluttertoast.showToast(
                  msg: "User authentified", backgroundColor: Colors.green),
              // userSession.saveSessionUser(user),
              Navigator.push(
                  context, SlideRightRoute(page: ControllerScreens()))
            }
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.4,
                        decoration: new BoxDecoration(
                            image: new DecorationImage(
                              image: new ExactAssetImage(
                                  "assets/images/road_cover.png"),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(30),
                                bottomRight: Radius.circular(30)),
                            border: Border.all(
                                width: 2,
                                style: BorderStyle.solid,
                                color: Colors.blue[200])),
                      ),
                      Positioned(
                        top: 230,
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
                                  'SIGN IN',
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
                          Input("Email", Icons.email, 10, emailController),
                          InputPassword(passwordController, 32),
                          forgotPassword,
                          SizedBox(
                            height: 25,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              MyButton("sign in", 3, this.signIn),
                              MyButton("Sign up", 3, this.signUp),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ],
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

// Scaffold.of(context).showSnackBar(SnackBar(
//       content: Text("Sending Message"),
//     ));
Widget forgotPassword = Align(
  alignment: Alignment.centerRight,
  child: new InkWell(
    child: Padding(
      padding: const EdgeInsets.only(top: 16, right: 32),
      child: Text(
        'Forgot Password ?',
        style: TextStyle(color: Colors.blue[600]),
      ),
    ),
    onTap: () => print("pssword forgot"),
  ),
);
