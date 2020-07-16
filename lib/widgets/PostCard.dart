import 'package:covoiturage_app/models/Post.dart';
import 'package:covoiturage_app/screens/Profile.dart';
import 'package:covoiturage_app/screens/UpdatePost.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:covoiturage_app/widgets/animatedRoute.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'CustomTextField.dart';
import 'MyButton.dart';

class BuildPost extends StatelessWidget {
  final Post post;
  BuildPost(this.post);
  @override
  Widget build(BuildContext context) {
    // var age = DateTime.now().difference(post.user.birthDay).inDays;
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
                              showBottomSheet(
                                context: context,
                                builder: (context) {
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
                                              // Navigator.push<void>(
                                              //   context,
                                              //   MaterialPageRoute(
                                              //     builder: (context) =>
                                              //         UpdatePost(),
                                              //     fullscreenDialog: true,
                                              //   ),
                                              // );
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
                                            onTap: () => print("update post"),
                                            title: Text(
                                              'delete your post',
                                              style: GoogleFonts.getFont(
                                                  'Source Code Pro'),
                                            ),
                                            trailing: Icon(Icons.delete),
                                          ),
                                        ],
                                      )
                                      /*  ListView.separated(
                                      itemCount: 4,
                                      separatorBuilder:
                                          (BuildContext context, int index) =>
                                              Divider(),
                                      itemBuilder:
                                          (BuildContext context, index) {
                                        return ListTile(
                                          title: Text('item $index'),
                                        );
                                      },
                                    ), */
                                      );
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
                      /*  trailing: InkWell(
                        onTap: () => print("show snackbar"),
                        child: Text(
                          '...',
                          style: TextStyle(
                            fontSize: 20,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey,
                          ),
                        ),
                      ), */
                      subtitle: Padding(
                        padding: EdgeInsets.only(top: 5),
                        child: Wrap(
                          alignment: WrapAlignment.start,
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            // Divider(color: Colors.white,),
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
                            // Divider(),
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
}
