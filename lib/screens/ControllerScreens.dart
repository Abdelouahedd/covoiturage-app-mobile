import 'package:covoiturage_app/contollers/UserSession.dart';
import 'package:covoiturage_app/models/User.dart';
import 'package:covoiturage_app/screens/Friends.dart';
import 'package:covoiturage_app/screens/Trajet.dart';
import 'package:covoiturage_app/widgets/NavigationDrawer.dart';
import 'package:covoiturage_app/widgets/TitledBottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Home.dart';

class ControllerScreens extends StatefulWidget {
  @override
  State createState() => _ControllerScreensState();
}

class _ControllerScreensState extends State<ControllerScreens> {
  User user;
  List<Item> items;
  int _currentIndex = 0;
  final List<Widget> _children = [Home(), Trajet(), Friends()];
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final UserSession userSession = new UserSession();

  @override
  void initState() {
    super.initState();
    //get current user connected
    userSession.getCurrentUser().then((value) => user = value);
    SystemChrome.setEnabledSystemUIOverlays([]);
    this.items = [
      new Item(
          'Home', Icons.home, () => this.setState(() => _currentIndex = 0)),
      Item('Trajet', Icons.add_circle_outline,
          () => this.setState(() => _currentIndex = 1)),
      Item(
          'Friends', Icons.group, () => this.setState(() => _currentIndex = 2)),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _key,
      appBar: AppBar(
        title: Text(items[_currentIndex].title),
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => _key.currentState.openDrawer(),
        ),
      ),
      drawer: NavigationDrawer(user: this.user),
      body: _children[_currentIndex],
      bottomNavigationBar: TitledBottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
      ),
    );
  }
}
