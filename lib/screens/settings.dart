import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  bool _lights = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE1F5FE),
      appBar: AppBar(
        title: Text("Setting"),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6)),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text("Abdelouahed"),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 30,
                        backgroundImage: AssetImage("assets/images/user.png"),
                      ),
                    ),
                    Divider(thickness: 1),
                    FlatButton(
                        onPressed: () => print("Hello"),
                        child: Text("Show profil"))
                  ]),
            ),
          ),
          Align(
            child: Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "GENERAL SETTINGS".toUpperCase(),
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w400,
                  ),
                )),
            alignment: Alignment.centerLeft,
          ),
          Card(
            margin: EdgeInsets.only(top: 20, left: 10, right: 10, bottom: 20),
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(6),
                    bottomLeft: Radius.circular(6)),
              ),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ListTile(
                      title: Text("Edit Profile"),
                      leading: Icon(Icons.person),
                      trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios), onPressed: null),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Change Password"),
                      leading: Icon(Icons.vpn_key),
                      trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios), onPressed: null),
                    ),
                    Divider(),
                    SwitchListTile(
                      title: Text("Notification"),
                      value: _lights,
                      onChanged: (bool value) {
                        setState(() {
                          _lights = value;
                        });
                      },
                      secondary: const Icon(Icons.notifications),
                    ),
                    Divider(),
                    SwitchListTile(
                      title: Text("Dark mode"),
                      value: _lights,
                      onChanged: (bool value) {
                        setState(() {
                          _lights = value;
                        });
                      },
                      secondary: const Icon(Icons.brightness_2),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Help"),
                      leading: Icon(Icons.help),
                      trailing: IconButton(
                          icon: Icon(Icons.arrow_forward_ios), onPressed: null),
                    ),
                  ]),
            ),
          ),
        ],
      ),
    );
  }
}
