import 'package:covoiturage_app/widgets/MyButton.dart';
import 'package:flutter/material.dart';

class Friends extends StatefulWidget {
  @override
  _FriendsState createState() => _FriendsState();
}

class _FriendsState extends State<Friends> {
  static String url =
      'https://www.abola.pt//img/fotos/abola2015/FOTOSAP/ESPANHA/2018/Messi12.jpg';

  static List<String> dados = [
    'Grupo dos Pereira',
    'Familia Silva',
    'Alice Pereira'
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (context, index) {
        var title = dados.elementAt(index);

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
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 8),
                    //   child: CircleAvatar(
                    //     radius: 20,
                    //     child: Image(
                    //       width: 50,
                    //       height: 50,
                    //       image: NetworkImage(
                    //           'http://alice-williams.com/wp-content/uploads/2018/03/Alice-Williams-bio-photo-cropped-768x697.jpg'),
                    //     ),
                    //   ),
                    // ),
                    // Column(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: <Widget>[
                    //     Text(
                    //       title,
                    //       style: TextStyle(
                    //           fontSize: 16, fontWeight: FontWeight.bold),
                    //     ),
                    //     StarDisplay(value: 3)
                    //   ],
                    // ),
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

class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
          color: Colors.blueAccent[100],
        );
      }),
    );
  }
}
