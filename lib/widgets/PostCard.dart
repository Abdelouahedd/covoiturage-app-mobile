import 'package:covoiturage_app/models/Post.dart';
import 'package:covoiturage_app/screens/Messages.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

import 'animatedRoute.dart';

class BuildPost extends StatelessWidget {
  final Post post;

  BuildPost(this.post);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: null,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: AnimatedContainer(
          margin: EdgeInsets.only(bottom: 24),
          duration: Duration(seconds: 2),
          child: Container(
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
                ListTile(
                  title: Text(
                    this.post.user.username,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  subtitle: Text(
                    "2017-08-14",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    backgroundImage: this.post.user.profileImg == null
                        ? AssetImage('assets/images/user.png')
                        : NetworkImage(this.post.user.profileImg),
                  ),
                ),
                this.post.imgDesc != ' '
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(6),
                        child: Image.network(
                          post.imgDesc,
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          fit: BoxFit.cover,
                        ),
                      )

                    // Expanded(
                    //     child: Container(
                    //       margin: EdgeInsets.all(5),
                    //       decoration: new BoxDecoration(
                    //         image: new DecorationImage(
                    //           image: NetworkImage(this.post.imgDesc),
                    //           fit: BoxFit.fill,
                    //         ),
                    //         borderRadius: BorderRadius.all(Radius.circular(15)),
                    //       ),
                    //     ),
                    //   )
                    : Container(),
                SizedBox(
                  height: 12,
                ),
                Divider(
                  color: Colors.grey.shade600,
                ),
                Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Icon(
                              Icons.time_to_leave,
                              color: Colors.blue,
                            ),
                            new Icon(
                              Icons.assistant_photo,
                              color: Colors.blue,
                            ),
                            new Icon(
                              Icons.monetization_on,
                              color: Colors.blue,
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black,
                                    ),
                                    text: "From : ",
                                    children: [
                                      TextSpan(
                                        text: this.post.from,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87,
                                        ),
                                      ),
                                    ]),
                              ),
                            ),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  text: "From : ",
                                  children: [
                                    TextSpan(
                                      text: this.post.from,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ]),
                            ),
                            RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                  text: "From : ",
                                  children: [
                                    TextSpan(
                                      text: this.post.from,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87,
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                      ],
                    )
                    // buildIconWithContxt(
                    //     Icons.time_to_leave, "From :  ", this.post.from),
                    // buildIconWithContxt(
                    //     Icons.assistant_photo, "To :  ", this.post.to),
                    // buildIconWithContxt(
                    //   Icons.access_time,
                    //   "Time :  ",
                    //   Util.convertDateToString(this.post.date) +
                    //       " At " +
                    //       Util.convertTimeToString(this.post.time),
                    // ),
                    // buildIconWithContxt(
                    //     Icons.monetization_on, "Price :  ", this.post.price),
                  ],
                ),
                Divider(
                  color: Colors.grey.shade600,
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 5),
                  child: InkWell(
                    onTap: () => Navigator.push(
                        context, SlideRightRoute(page: Messages())),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.send,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "contact",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildFooter(Widget part1, Widget part2) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 10, right: 33),
      child: Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        children: <Widget>[
          new Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              part1,
              new SizedBox(
                width: 16.0,
              ),
              part2
            ],
          ),
        ],
      ),
    );
  }

  Row buildIconWithContxt(IconData icon, String title, String description) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        new Icon(
          icon,
          color: Colors.blue,
        ),
        new SizedBox(
          width: 8.0,
        ),
        RichText(
          text: TextSpan(
              style: TextStyle(
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
              text: title,
              children: [
                TextSpan(
                  text: description,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ]),
        )
      ],
    );
  }
}
