import 'dart:io';

import 'package:covoiturage_app/widgets/Input.dart';
import 'package:covoiturage_app/widgets/MyButton.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

enum TypeClient { Passager, Conducteur }

class Trajet extends StatefulWidget {
  @override
  _TrajetState createState() => _TrajetState();
}

class _TrajetState extends State<Trajet> {
  TypeClient _client = TypeClient.Conducteur;
  File _image;
  DateTime selectedDate = DateTime.now();

  TextEditingController _from = new TextEditingController();
  TextEditingController _to = new TextEditingController();
  TextEditingController _time = new TextEditingController();
  TextEditingController _date = new TextEditingController();
  TextEditingController _price = new TextEditingController();
  TextEditingController _description = new TextEditingController();

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      if (_image != null) {
        throw new Exception("Could not pick image from galery");
      }
    });
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      if (_image != null) {
        throw new Exception("Could not pick image from camera");
      }
    });
  }

  Future<Null> selectedTime(BuildContext context) async {
    final Future<TimeOfDay> selectedTime = showTimePicker(
      initialTime: TimeOfDay.now(),
      context: context,
    );
    selectedTime.then((value) => _time.text = value.format(context));
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(new Duration(days: 360)),
      // lastDate:DateTime.now().add(new Duration(days: 360)),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
        _date.text = DateFormat('yyyy-MM-dd').format(picked);
      });
  }

  void submitPost() {
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        decoration: new BoxDecoration(),
        child: Column(
          children: [
            Row(
              children: [
                Flexible(
                  child: RadioListTile<TypeClient>(
                      autofocus: true,
                      activeColor: Colors.blueAccent,
                      title: Text("Passager"),
                      value: TypeClient.Passager,
                      groupValue: _client,
                      onChanged: (TypeClient typeClient) => this.setState(() {
                            _client = typeClient;
                          })),
                ),
                Flexible(
                  child: RadioListTile<TypeClient>(
                      activeColor: Colors.blueAccent,
                      title: Text("Conducteur"),
                      value: TypeClient.Conducteur,
                      groupValue: _client,
                      onChanged: (TypeClient typeClient) => this.setState(() {
                            _client = typeClient;
                          })),
                ),
              ],
            ),
            new Input("From", Icons.time_to_leave, 5, _from),
            new Input("To  ", Icons.assistant_photo, 5, _to),
            new Input(
              "Time  ",
              Icons.access_time,
              10,
              _time,
              disable: true,
              tap: () => this.selectedTime(context),
            ),
            new Input(
              "Date  ",
              Icons.data_usage,
              10,
              _date,
              disable: true,
              tap: () => this._selectDate(context),
            ),
            _client == TypeClient.Passager
                ? Container()
                : new Input("Price ", Icons.monetization_on, 10, _price),
            buildTexterea(),
            new SizedBox(
              height: 22,
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 10,
              crossAxisAlignment: WrapCrossAlignment.start,
              alignment: WrapAlignment.spaceEvenly,
              children: [
                _image == null
                    ? Container(
                        width: size.width / 3,
                        child: Row(
                          children: [
                            new IconButton(
                              icon: new Icon(Icons.add_photo_alternate),
                              onPressed: getImage,
                              color: new Color(0xff203152),
                            ),
                            new IconButton(
                              icon: new Icon(Icons.add_a_photo),
                              onPressed: getImageFromCamera,
                              color: new Color(0xff203152),
                            ),
                          ],
                        ),
                      )
                    : Container(
                        width: size.width / 3,
                        child: Text(
                          _image.absolute.path,
                          softWrap: true,
                          overflow: TextOverflow.ellipsis,
                        )),
                // new SizedBox(width: 180,),
                MyButton("Post", 3, null),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTexterea() {
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: 100,
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLines: null,
        controller: _description,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: "Description ..",
          hintStyle: TextStyle(color: Colors.blue),
          errorStyle: TextStyle(color: Colors.red),
        ),
        style: TextStyle(color: Colors.blue[700]),
      ),
    );
  }
}
