import 'package:covoiturage_app/contollers/UserSession.dart';
import 'package:covoiturage_app/models/User.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final image = 'assets/images/user.png';
  User user;
  UserSession userSession = new UserSession();
  @override
  void initState() {
    super.initState();
    user = userSession.getCurrentUser();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: PreferredSize(
      //   preferredSize: Size.fromHeight(35.0), // here the desired height
      //   child: AppBar(
      //     title: Center(child: Text("Profile"),),
      //     leading: IconButton(
      //       icon: Icon(
      //         Icons.arrow_back,
      //         color: Colors.white,
      //         size: 30,
      //       ),
      //       onPressed: () => Navigator.of(context).pop(),
      //     ),
      //   ),
      // ),
      body: SingleChildScrollView(
        child: Container(
          decoration: new BoxDecoration(
            color: Colors.grey.shade300,
          ),
          child: Stack(
            children: <Widget>[
              SizedBox(
                height: 160,
                width: double.infinity,
                child: Container(
                  decoration: new BoxDecoration(color: Colors.blue),
                ),
              ),
              Positioned(
                top: 10,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(16.0, 50.0, 16.0, 16.0),
                child: Column(
                  children: <Widget>[
                    Stack(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.all(18.0),
                          margin: EdgeInsets.only(top: 2.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 96.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      user.username,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    ListTile(
                                      contentPadding: EdgeInsets.all(0),
                                      title: Text("Product Designer"),
                                      subtitle: Text("Kathmandu"),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Row(
                                children: <Widget>[
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text("285"),
                                        Text("Likes")
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text("3025"),
                                        Text("Comments")
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: <Widget>[
                                        Text("650"),
                                        Text("Favourites")
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                              image: AssetImage(image),
                              fit: BoxFit.cover,
                            ),
                          ),
                          margin: EdgeInsets.only(left: 16.0, top: 30),
                        ),
                      ],
                    ),
                    SizedBox(height: 15.0),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Column(
                        children: <Widget>[
                          ListTile(
                            title: Text("User information"),
                          ),
                          Divider(),
                          ListTile(
                            title: Text("Email"),
                            subtitle: Text(user.email),
                            leading: Icon(Icons.email),
                          ),
                          ListTile(
                            title: Text("Phone"),
                            subtitle: Text("+977-9815225566"),
                            leading: Icon(Icons.phone),
                          ),
                          ListTile(
                            title: Text("Phone"),
                            subtitle: Text("+977-9815225566"),
                            leading: Icon(Icons.phone),
                          ),
                          ListTile(
                            title: Text("Joined Date"),
                            subtitle: Text("15 February 2019"),
                            leading: Icon(Icons.calendar_view_day),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
