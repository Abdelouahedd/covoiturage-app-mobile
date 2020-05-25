import 'package:covoiturage_app/screens/SignUp.dart';
import 'package:covoiturage_app/widgets/Input.dart';
import 'package:covoiturage_app/widgets/InputPassword.dart';
import 'package:covoiturage_app/widgets/MyButton.dart';
import 'package:covoiturage_app/widgets/animatedRoute.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  String image = "";
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
    print(
        "Login ${emailController.text} and password ${passwordController.text}");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                            border: Border.all(color: Colors.blue),
                            color: Colors.white,
                          ),
                          child: new FlatButton(
                            onPressed: null,
                            child: Text(
                              'SIGN IN',
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
                      Input("Email", Icons.email, 0, emailController),
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
