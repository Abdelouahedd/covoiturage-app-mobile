import 'package:covoiturage_app/contollers/PostController.dart';
import 'package:covoiturage_app/models/Post.dart';
import 'package:covoiturage_app/widgets/PostCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
  final PostController postController = new PostController();
  List<Post> posts = new List();
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    postController.getAllPosts().then((value) => {
          posts = value,
          this.setState(() => isLoading = false),
        });
  }

  @override
  Widget build(BuildContext context) {
    // String img = "assets/images/user.png";

    return isLoading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor)),
            ),
            color: Colors.white.withOpacity(0.8),
          )
        : ListView.builder(
            // separatorBuilder: (context, index) => Padding(
            //   padding: const EdgeInsets.all(2.0),
            //   child: Divider(
            //     color: Colors.grey,
            //   ),
            // ),
            itemCount: posts.length,
            itemBuilder: (context, index) => new BuildPost(posts[index]),
          );
  }
}
