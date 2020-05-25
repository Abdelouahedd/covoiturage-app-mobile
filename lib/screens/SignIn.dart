import 'package:covoiturage_app/widgets/Input.dart';
import 'package:covoiturage_app/widgets/InputPassword.dart';
import 'package:covoiturage_app/widgets/MyButton.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();

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

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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
                      image: new AssetImage("assets/images/road.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
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
                          border: Border.all(color: Colors.grey),
                          color: Colors.white,
                        ),
                        child: new FlatButton(
                          onPressed: null,
                          child: Text(
                            'SIGN IN',
                            style:
                                TextStyle(fontSize: 30.0, color: Colors.grey),
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
                    Input("Email", Icons.email, emailController),
                    InputPassword(passwordController),
                    forgotPassword,
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyButton(
                            "sign in", 3, () => {print(emailController.text)}),
                        MyButton("Sign up", 3, () => {print("Sign OUT")}),
                      ],
                    )
                  ],
                ),
              )
            ],
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
        style: TextStyle(color: Colors.grey[500]),
      ),
    ),
    onTap: () => print("pssword forgot"),
  ),
);
