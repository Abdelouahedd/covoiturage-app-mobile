import 'package:covoiturage_app/models/Post.dart';
import 'package:covoiturage_app/screens/Profile.dart';
import 'package:covoiturage_app/services/Util.dart';
import 'package:covoiturage_app/widgets/animatedRoute.dart';
import 'package:flutter/material.dart';

import 'StarDisplay.dart';

class BuildPost extends StatelessWidget {
  final Post post;
  BuildPost(this.post);
  @override
  Widget build(BuildContext context) {
    var age = DateTime.now().difference(post.user.birthDay).inDays;
    return Card(
      margin: EdgeInsets.only(top: 4),
      elevation: 8,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: ClipRRect(
        child: Banner(
          color: this.post.price == null ? Colors.green : Colors.blue,
          location: BannerLocation.topEnd,
          message: this.post.price == null ? "Demande" : "Offre",
          child: Container(
            margin: EdgeInsets.only(top: 4),
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
                      onTap: () => Navigator.push(
                        context,
                        SlideRightRoute(
                            page: ProfilePage(user: this.post.user)),
                      ),
                      isThreeLine: true,
                      // dense: true,
                      title: Text(
                        this.post.user.username +
                            ", Age " +
                            age.toString() +
                            " ans",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      trailing: Text(
                        this.post.price ?? '',
                        style: TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      subtitle: Wrap(
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
                          Text(
                            Util.convertDateToString(this.post.date) +
                                " / " +
                                Util.convertTimeToString(this.post.time),
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[400]),
                          ),
                        ],
                      ),
                      leading: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 20,
                        backgroundImage: this.post.user.profileImg == null
                            ? AssetImage('assets/images/user.png')
                            : NetworkImage(this.post.user.profileImg),
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: 65,
                        ),
                        new StarDisplay(
                          value: this.post.user.rank.toInt(),
                        ),
                      ],
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
