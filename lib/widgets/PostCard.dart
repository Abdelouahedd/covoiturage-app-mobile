import 'package:covoiturage_app/screens/Messages.dart';
import 'package:flutter/material.dart';

import 'animatedRoute.dart';

class BuildPost extends StatelessWidget {
  String img;

  BuildPost([this.img]);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      color: Colors.white,
      elevation: 10.0,
      margin: new EdgeInsets.symmetric(vertical: 10.0, horizontal: 10),
      child: ClipRRect(
        child: Container(
          height: this.img != null ? 350 : 200,
          child: Column(
            children: [
              Banner(
                location: BannerLocation.topEnd,
                color: Colors.green,
                message: "New ",
                child: ListTile(
                  title: Text(
                    "Abdelouahed",
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
                    backgroundImage: AssetImage(img),
                  ),
                ),
              ),
              this.img != null
                  ? Expanded(
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: new BoxDecoration(
                          image: new DecorationImage(
                            image: Image.asset("assets/images/road_cover.png")
                                .image,
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                        ),
                      ),
                    )
                  : Container(),
              Divider(
                color: Colors.grey.shade600,
              ),
              buildFooter(
                  buildIconWithContxt(
                      Icons.time_to_leave, "From :  ", "Marrakech"),
                  buildIconWithContxt(
                      Icons.assistant_photo, "To :  ", "AGADIR")),
              buildFooter(
                  buildIconWithContxt(Icons.access_time, "Time :  ", "15:30"),
                  buildIconWithContxt(
                      Icons.monetization_on, "Price :  ", "100 DH")),
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
