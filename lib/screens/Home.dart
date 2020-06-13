import 'package:covoiturage_app/widgets/PostCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    String img = "assets/images/user.png";

    return ListView.builder(
        itemCount: 5, itemBuilder: (context, index) => new BuildPost(img));
  }
}
