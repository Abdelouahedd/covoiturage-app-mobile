import 'package:covoiturage_app/widgets/StarDisplay.dart';
import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        return Container(
          width: double.maxFinite,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.5,
                      child: ListTile(
                        title: Text(
                          "Abdelouahed",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        subtitle: StarDisplay(value: 3),
                        leading: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 20,
                          backgroundImage: AssetImage("assets/images/user.png"),
                        ),
                      ),
                    ),
                    Spacer(
                      flex: 2,
                    ),
                    Center(
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 35,
                        child: IconButton(
                            icon: Icon(
                              Icons.message,
                              color: Colors.blue[200],
                            ),
                            onPressed: null),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 150,
                ),
                Container(
                  margin: EdgeInsets.only(left: 50),
                  child: Divider(
                    color: Colors.grey,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
