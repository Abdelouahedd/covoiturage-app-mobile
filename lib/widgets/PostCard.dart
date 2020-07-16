import 'package:covoiturage_app/models/Post.dart';
import 'package:covoiturage_app/screens/Profile.dart';
import 'package:covoiturage_app/screens/UpdatePost.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:covoiturage_app/widgets/MyButton.dart';
import 'package:covoiturage_app/widgets/animatedRoute.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildPost extends StatelessWidget {
  final Post post;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  BuildPost(this.post);
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(top: 4),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        child: Banner(
          color: this.post.price == null ? Colors.green : Colors.blue,
          location: BannerLocation.topStart,
          message: this.post.price == null ? "Demande" : "Offre",
          child: Container(
            margin: EdgeInsets.only(bottom: 4),
            padding: EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(6),
                  bottomLeft: Radius.circular(6)),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ListTile(
                      isThreeLine: true,
                      title: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () => Navigator.push(
                              context,
                              SlideRightRoute(
                                page: ProfilePage(user: this.post.user),
                              ),
                            ),
                            child: Text(
                              this.post.user.username,
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Scaffold.of(context).showBottomSheet(
                                // context: context,
                                // builder:
                                (context) {
                                  return Container(
                                      height:
                                          MediaQuery.of(context).size.height /
                                              4,
                                      decoration: new BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(10.0),
                                            topLeft: Radius.circular(10.0)),
                                        color: Colors.grey,
                                      ),
                                      child: Column(
                                        children: [
                                          ListTile(
                                            onTap: () {
                                              Navigator.push(
                                                context,
                                                SizeRoute(
                                                  page: UpdatePost(
                                                    post: this.post,
                                                  ),
                                                ),
                                              );
                                            },
                                            title: Text(
                                              'update your post',
                                              style: GoogleFonts.getFont(
                                                  'Source Code Pro'),
                                            ),
                                            trailing: Icon(Icons.create),
                                          ),
                                          Divider(
                                            thickness: 1,
                                          ),
                                          ListTile(
                                            onTap: () =>
                                                _showAlertDialog(context),
                                            title: Text(
                                              'delete your post',
                                              style: GoogleFonts.getFont(
                                                  'Source Code Pro'),
                                            ),
                                            trailing: Icon(Icons.delete),
                                          ),
                                        ],
                                      ));
                                },
                              );
                            },
                            child: Text(
                              '...',
                              style: TextStyle(
                                fontSize: 20,
                                fontStyle: FontStyle.italic,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Text(
                              this.post.from.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                            Text("   ---"),
                            Icon(Icons.arrow_right),
                            Text(
                              this.post.to.toUpperCase(),
                              style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.black87),
                            ),
                            RichText(
                              text: TextSpan(
                                  text: "Time : ",
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black),
                                  children: [
                                    TextSpan(
                                      text: Util.convertDateToString(
                                              this.post.date) +
                                          " / " +
                                          Util.convertTimeToString(
                                              this.post.time),
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.black),
                                    )
                                  ]),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                RichText(
                                  text: TextSpan(
                                      text: "Places :",
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black87),
                                      children: [
                                        TextSpan(
                                          text: post.nbrPlaces.toString(),
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.black87),
                                        )
                                      ]),
                                ),
                                this.post.price != null
                                    ? RichText(
                                        text: TextSpan(
                                            text: "Price  :",
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.black87),
                                            children: [
                                              TextSpan(
                                                text: this.post.price ?? '',
                                                style: TextStyle(
                                                    fontSize: 15,
                                                    fontWeight: FontWeight.w400,
                                                    color: Colors.black87),
                                              )
                                            ]),
                                      )
                                    : Container(),
                              ],
                            )
                          ],
                        ),
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        backgroundImage: this.post.user.profileImg == null
                            ? AssetImage('assets/images/user.png')
                            : NetworkImage(this.post.user.profileImg),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Divider(
                      height: 5,
                      color: Colors.grey.shade600,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    final theme = Theme.of(context);
    final dialogTextStyle = theme.textTheme.subtitle1
        .copyWith(color: theme.textTheme.caption.color);
    _showDemoDialog<String>(
      context: context,
      child: AlertDialog(
        content: Text(
          "Are you shure to delete your post ?",
          style: dialogTextStyle,
        ),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MyButton("confirme", 4, () => print("hay")),
              MyButton("cancel", 4,
                  () => Navigator.of(context, rootNavigator: true).pop()),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _showDemoDialog<T>({BuildContext context, Widget child}) async {
    child = Container(
      child: Theme(
        data: Theme.of(context),
        child: child,
      ),
    );
    await showDialog<T>(
      context: context,
      builder: (context) => child,
    );
  }
}
