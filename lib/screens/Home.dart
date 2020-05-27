import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State createState() => _HomePageState();
}

class _HomePageState extends State<Home> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    String img = "assets/images/user.png";

    return Card(
      color: Colors.grey[300],
      elevation: 10.0,
      margin: new EdgeInsets.symmetric(vertical: 15.0, horizontal: 10),
      child: ClipRRect(
        child: Container(
          height: 350,
          child: Column(
            children: [
              Banner(
                location: BannerLocation.topEnd,
                color: Colors.green,
                message: "New ",
                child: ListTile(
                  title: Text("Abdelouahed"),
                  subtitle: Text("2017-08-14"),
                  leading: CircleAvatar(
                    backgroundColor: Colors.white,
                    radius: 20,
                    backgroundImage: AssetImage(img),
                  ),
                ),
              ),
              // Flexible(
              //   flex: 1,
              //   fit: FlexFit.loose,
              //   child: Container(
              //     margin: EdgeInsets.all(5),
              //     decoration: new BoxDecoration(
              //         image: new DecorationImage(
              //           image:
              //               Image.asset("assets/images/road_cover.png").image,
              //           fit: BoxFit.fill,
              //         ),
              //         borderRadius: BorderRadius.all(Radius.circular(15))),
              //   ),
              // ),
              Container(
                height: 150,
                margin: EdgeInsets.all(5),
                decoration: new BoxDecoration(
                    image: new DecorationImage(
                      image: Image.asset("assets/images/road_cover.png").image,
                      fit: BoxFit.fill,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(15))),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10, right: 30),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 10,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Icon(
                              Icons.time_to_leave,
                            ),
                            new SizedBox(
                              width: 4.0,
                            ),
                            Text("From : Marrakech ")
                          ],
                        ),
                        new SizedBox(
                          width: 8.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Icon(
                              Icons.assistant_photo,
                            ),
                            new SizedBox(
                              width: 4.0,
                            ),
                            Text("To : Marrakech ")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, left: 10, right: 33),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Icon(
                              Icons.access_time,
                            ),
                            new SizedBox(
                              width: 4.0,
                            ),
                            Text("Time : 15:20 ")
                          ],
                        ),
                        new SizedBox(
                          width: 16.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            new Icon(
                              Icons.monetization_on,
                            ),
                            new SizedBox(
                              width: 4.0,
                            ),
                            Text("Price : 100DH ")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey.shade600,
              ),
              // Container(
              //   padding: EdgeInsets.all(5),
              //   height: 25,
              //   child: Center(
              //     child:
              //         IconButton(icon: Icon(Icons.ac_unit), onPressed: () {}),
              //   ),
              // )
             
            ],
          ),
        ),
      ),
    );
  }
}
//
