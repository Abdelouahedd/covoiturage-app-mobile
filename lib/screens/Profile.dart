import 'package:covoiturage_app/contollers/UserSession.dart';
import 'package:covoiturage_app/models/User.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:covoiturage_app/widgets/StarDisplay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final image = 'assets/images/user.png';
  User user;
  UserSession userSession;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    userSession = new UserSession();
    userSession.getCurrentUser().then((value) => {
          user = value,
          this.setState(() => isLoading = false),
        });
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
      body: isLoading
          ? Container(
              child: Center(
                child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(
                        Theme.of(context).primaryColor)),
              ),
              color: Colors.white.withOpacity(0.8),
            )
          : SingleChildScrollView(
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
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Center(
                                            child: Text(
                                              user.username,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                          ),
                                          // ListTile(
                                          //   contentPadding: EdgeInsets.all(0),
                                          //   title: Text("Product Designer"),
                                          //   subtitle: Text("Kathmandu"),
                                          // ),

                                          SizedBox(height: 35.0),
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 15.0),
                                    Row(
                                      children: <Widget>[
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Text("0"),
                                              Text("Posts")
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Text("0"),
                                              Text("Comments")
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            children: <Widget>[
                                              Text("0"),
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
                          SizedBox(height: 18.0),
                          Column(
                            children: <Widget>[
                              Divider(
                                thickness: 2,
                              ),
                              Card(
                                child: ListTile(
                                  title: Text("Email"),
                                  subtitle: Text(user.email),
                                  leading: Icon(Icons.email),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text("City"),
                                  subtitle: Text(user.city),
                                  leading: Icon(Icons.location_city),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text("Birth Day"),
                                  subtitle: Text(
                                      Util.convertDateToString(user.birthDay)),
                                  leading: Icon(Icons.calendar_today),
                                ),
                              ),
                              Card(
                                child: ListTile(
                                  title: Text("Rank "),
                                  subtitle: new StarDisplay(
                                    value: user.rank.toInt(),
                                  ),
                                  leading: Icon(Icons.star),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
      bottomNavigationBar: buildButton(context),
    );
  }

  Widget buildButton(context) {
    return GestureDetector(
      onTap: null,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.blue,
              Colors.blue[300],
            ],
          ),
        ),
        child: Center(
          child: Text(
            "Edit profil".toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
