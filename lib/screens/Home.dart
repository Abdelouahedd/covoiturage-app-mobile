import 'package:covoiturage_app/contollers/PostController.dart';
import 'package:covoiturage_app/models/Post.dart';
import 'package:covoiturage_app/widgets/PostCard.dart';
import 'package:covoiturage_app/widgets/SearchField.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
  final PostController postController = new PostController();
  List<Post> posts = new List();
  List<Post> filterPosts = new List();
  bool isLoading = true;
  final TextEditingController _filter = new TextEditingController();
  String _searchText = "";

  @override
  void initState() {
    super.initState();
    postController.getAllPosts().then((value) => {
          posts = value,
          filterPosts = value,
          this.setState(() => isLoading = false),
        });
  }

/* //  didChangeDependencies
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Firestore.instance.collection("posts").snapshots().listen((result) {
      result.documentChanges.forEach((res) {
        if (res.type == DocumentChangeType.added) {
          print("added");
          print(res.document.data);
        } else if (res.type == DocumentChangeType.modified) {
          print("modified");
          print(res.document.data);
        } else if (res.type == DocumentChangeType.removed) {
          print("removed");
          print(res.document.data);
        }
      });
    });
  }
 */
  _changeStateOfTextField() {
    _filter.addListener(() {
      if (_filter.text.isEmpty) {
        setState(() {
          _searchText = "";
          filterPosts = posts;
        });
      } else {
        setState(() {
          _searchText = _filter.text;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_searchText.length > 0) {
      List<Post> tempList = new List();
      for (int i = 0; i < filterPosts.length; i++) {
        if (filterPosts[i].from.toLowerCase().contains(_searchText) ||
            filterPosts[i].to.toLowerCase().contains(_searchText)) {
          tempList.add(filterPosts[i]);
        }
      }
      this.setState(() {
        filterPosts = tempList;
      });
    }
    return isLoading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Theme.of(context).primaryColor)),
            ),
            color: Colors.white.withOpacity(0.8),
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: new SearchField(_filter, _changeStateOfTextField),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: filterPosts.length,
                  itemBuilder: (context, index) =>
                      new BuildPost(filterPosts[index]),
                ),
              ),
            ],
          );
  }
}
