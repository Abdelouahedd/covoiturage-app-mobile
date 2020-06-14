import 'package:covoiturage_app/screens/Messages.dart';
import 'package:covoiturage_app/screens/Profile.dart';
import 'package:covoiturage_app/screens/SignIn.dart';
import 'package:covoiturage_app/widgets/animatedRoute.dart';
import 'package:flutter/material.dart';

class NavigationDrawer extends StatefulWidget {
  @override
  _NavigationDrawerState createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  final String image = "assets/images/user.png";

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
        color: Colors.blueGrey[100],
        boxShadow: [BoxShadow(color: Colors.black45)],
      ),
      width: MediaQuery.of(context).size.width / 1.2,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.grey.shade800,
                  ),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ),
              Container(
                height: 90,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient:
                      LinearGradient(colors: [Colors.blue, Colors.blue[200]]),
                ),
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 40,
                  backgroundImage: AssetImage(image),
                ),
              ),
              SizedBox(height: 5.0),
              Text(
                "erika costell",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600),
              ),
              Text(
                "@erika07",
                style: TextStyle(color: Colors.grey.shade800, fontSize: 16.0),
              ),
              SizedBox(height: 30.0),
              Container(
                padding: const EdgeInsets.only(left: 16.0, right: 20),
                child: Column(
                  children: [
                    _buildRow(Icons.person_pin, "My profile",
                        go: () => Navigator.push(
                            context, SlideRightRoute(page: ProfilePage()))),
                    _buildDivider(),
                    _buildRow(Icons.message, "Messages",
                        showBadge: true,
                        go: () => Navigator.push(
                            context, SlideRightRoute(page: Messages()))),
                    _buildDivider(),
                    _buildRow(Icons.notifications, "Notifications",
                        showBadge: true),
                    _buildDivider(),
                    _buildRow(Icons.email, "Contact us"),
                    _buildDivider(),
                    _buildRow(Icons.settings, "Settings"),
                    _buildDivider(),
                    _buildRow(Icons.arrow_back, "Log out",
                        go: () => Navigator.pushReplacement(
                            context, SlideRightRoute(page: SignIn()))),
                    _buildDivider(),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Divider _buildDivider() {
  return Divider(
    color: Colors.grey.shade600,
  );
}

Widget _buildRow(IconData icon, String title,
    {bool showBadge = false, Function go}) {
  final TextStyle tStyle =
      TextStyle(color: Colors.grey.shade800, fontSize: 16.0);
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5.0),
    child: GestureDetector(
      onTap: go,
      child: Container(
        child: Row(children: [
          Icon(
            icon,
            color: Colors.grey.shade800,
          ),
          SizedBox(width: 10.0),
          Text(
            title,
            style: tStyle,
          ),
          Spacer(),
          if (showBadge)
            Material(
              color: Colors.deepOrange,
              elevation: 5.0,
              shadowColor: Colors.red,
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                width: 25,
                height: 25,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Text(
                  "10+",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
        ]),
      ),
    ),
  );
}
