import 'package:covoiturage_app/contollers/PostController.dart';
import 'package:covoiturage_app/contollers/UserSession.dart';
import 'package:covoiturage_app/models/Post.dart';
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
  final UserSession userSession = new UserSession();
  final PostController postController = new PostController();
  List<Post> posts = new List();
  List<Item> items;
  int _currentIndex = 0;
  List<Widget> _children;
  bool isLoading = true;
  final GlobalKey<ScaffoldState> _key = GlobalKey<ScaffoldState>();
  final Color primary = Colors.white;
  final Color active = Colors.grey.shade800;
  final Color divider = Colors.grey.shade600;

  @override
  void initState() {
    super.initState();
    userSession.getCurrentUser().then((value) => {
          user = value,
          this.setState(() => isLoading = false),
        });
    
    SystemChrome.setEnabledSystemUIOverlays([]);
    _children = [Home(), Trajet(), Friends()];
    this.items = [
      new Item(
          'Home',
          Icons.home,
          () => this.setState(() {
                _currentIndex = 0;
              })),
      Item(
          'Trajet',
          Icons.add_circle_outline,
          () => this.setState(() {
                _currentIndex = 1;
              })),
      Item(
          'Friends',
          Icons.group,
          () => this.setState(() {
                _currentIndex = 2;
              })),
    ];
  }

  @override
  void dispose() {
    super.dispose();
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
          onPressed: () {
            _key.currentState.openDrawer();
          },
        ),
      ),
      drawer: NavigationDrawer(user: this.user),
      body: Stack(
        children: [
          _children[_currentIndex],
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
      bottomNavigationBar: TitledBottomNavigationBar(
        items: items,
        currentIndex: _currentIndex,
      ),
    );
  }
}
