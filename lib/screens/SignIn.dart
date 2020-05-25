import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 2,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.email,
                              color: Colors.grey[600],
                            ),
                            hintText: 'Email',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 1.2,
                        height: 45,
                        margin: EdgeInsets.only(top: 32),
                        padding: EdgeInsets.only(
                            top: 4, left: 16, right: 16, bottom: 4),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(color: Colors.black12, blurRadius: 5)
                            ]),
                        child: TextField(
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          autocorrect: true,
                          style: TextStyle(color: Colors.grey[700]),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            icon: Icon(
                              Icons.vpn_key,
                              color: Colors.grey[600],
                            ),
                            suffixIcon: Icon(
                              Icons.,
                              color: Colors.grey[600],
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerRight,
                          child: new InkWell(
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(top: 16, right: 32),
                              child: Text(
                                'Forgot Password ?',
                                style: TextStyle(color: Colors.grey[500]),
                              ),
                            ),
                            onTap: () => print("pssword forgot"),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600],
                                    Colors.grey,
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Center(
                              child: Text(
                                'Sign IN'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          Container(
                            height: 45,
                            width: MediaQuery.of(context).size.width / 3,
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    Colors.grey[600],
                                    Colors.grey,
                                  ],
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50))),
                            child: Center(
                              child: Text(
                                'Sign up'.toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
