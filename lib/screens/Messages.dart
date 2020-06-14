import 'dart:io';

import 'package:covoiturage_app/screens/Profile.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  var date = new DateFormat.yMd().format(new DateTime.now());
  bool enableButton = false;
  TextEditingController textEditingController;
  ScrollController scrollController;
  var messages = List<Message>();
  File _image;
  bool isLoading;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
      if (_image != null) {
        messages.add(Message.fromMessage(img: _image));
      }
      Future.delayed(Duration(milliseconds: 100), () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            curve: Curves.ease, duration: Duration(milliseconds: 500));
      });
    });
  }

  Future getImageFromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
      if (_image != null) {
        messages.add(Message.fromMessage(img: _image));
      }
      Future.delayed(Duration(milliseconds: 100), () {
        scrollController.animateTo(scrollController.position.maxScrollExtent,
            curve: Curves.ease, duration: Duration(milliseconds: 50));
      });
    });
  }

  @override
  void initState() {
    messages.add(new Message(type: 1, msg: "Bonjour Mr Mohamed"));
    messages.add(new Message(type: 1, msg: "Bonjour Monsieur"));
    messages.add(new Message(
        type: 1,
        msg: "Vous avez une mission trés urgent à l'adresse mentionnné !"));
    messages.add(new Message(type: 1, msg: "D'accord!"));

    textEditingController = TextEditingController();
    scrollController = ScrollController();

    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.ease, duration: Duration(milliseconds: 500));
    });
    isLoading = false;
    super.initState();
  }

  void handleSendMessage() {
    var text = textEditingController.value.text;

    textEditingController.clear();
    setState(() {
      messages.add(new Message(type: 1, msg: text));
      enableButton = false;
    });

    Future.delayed(Duration(milliseconds: 100), () {
      scrollController.animateTo(scrollController.position.maxScrollExtent,
          curve: Curves.ease, duration: Duration(milliseconds: 500));
    });
  }

  void choiceAction(String choice) {
    if (choice == "Settings") {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProfilePage(),
        ),
      );
    } else if (choice == "contact") {
      print('Subscribe');
    }
  }

  @override
  Widget build(BuildContext context) {
    var textInput = Container(
      child: Row(
        children: <Widget>[
          new IconButton(
            icon: new Icon(Icons.image),
            onPressed: getImage,
            color: new Color(0xff203152),
          ),
          enableButton
              ? Container()
              : new IconButton(
                  icon: new Icon(Icons.camera_alt),
                  onPressed: getImageFromCamera,
                  color: new Color(0xff203152),
                ),
          Expanded(
            child: Container(
              child: TextField(
                maxLines: null,
                onChanged: (text) {
                  setState(() {
                    enableButton = text.isNotEmpty;
                  });
                },
                style: TextStyle(color: new Color(0xff203152), fontSize: 15.0),
                controller: textEditingController,
                decoration: InputDecoration.collapsed(
                  hintText: 'Type your message...',
                  hintStyle: TextStyle(color: new Color(0xffaeaeae)),
                ),
              ),
            ),
          ),
          enableButton
              ? IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(
                    Icons.send,
                  ),
                  disabledColor: Colors.grey,
                  onPressed: handleSendMessage,
                )
              : IconButton(
                  color: Colors.blue,
                  icon: Icon(
                    Icons.send,
                  ),
                  disabledColor: Colors.grey,
                  onPressed: null,
                ),
        ],
      ),
      width: MediaQuery.of(context).size.width, //double.infinity,
      height: 60.0,
      decoration: new BoxDecoration(
          border: new Border(
              top: new BorderSide(color: new Color(0xffE8E8E8), width: 0.5)),
          color: Colors.white),
    );
    String img = "assets/images/user.png";
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: true,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () => Navigator.pop(context, false),
          ),
          title: ListTile(
            title: Text(
              "Abdelouahed",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),
            leading: CircleAvatar(
              backgroundColor: Colors.white,
              radius: 20,
              backgroundImage: AssetImage(img),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              onSelected: choiceAction,
              itemBuilder: (BuildContext context) {
                return {"Profil", "contact"}.map((String choice) {
                  return PopupMenuItem<String>(
                    value: choice,
                    child: Text(choice),
                  );
                }).toList();
              },
            ),
          ],
        ),
        backgroundColor: Color.fromRGBO(240, 248, 255, 0.9),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: <Widget>[
              Expanded(
                flex: 9,
                child: ListView.builder(
                    itemCount: messages.length,
                    controller: scrollController,
                    itemBuilder: (_, int index) {
                      bool reverse = false;
                      if (index % 2 == 0) {
                        reverse = true;
                      }

                      var bodyMessage = Flexible(
                        child: Container(
                            padding: EdgeInsets.all(8.0),
                            margin: EdgeInsets.all(4.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8.0))),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Flexible(
                                    child: Container(
                                  child: messages[index].type == 1
                                      ? Text(messages[index].msg)
                                      : Image.file(messages[index].img),
                                )),
                                SizedBox(
                                  width: 8.0,
                                  height: 20.0,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(top: 16.0),
                                      child: Text(
                                        date,
                                        style: TextStyle(
                                            fontSize: 10.0, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            )),
                      );

                      var avaterA = Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 8.0, right: 8.0),
                        child: CircleAvatar(
                          child: Text("A"),
                        ),
                      );
                      var avaterB = Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, bottom: 8.0, right: 8.0),
                        child: CircleAvatar(
                          child: Text("B"),
                          backgroundColor: Colors.red,
                        ),
                      );

                      if (reverse) {
                        return Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [bodyMessage, avaterA]);
                      } else {
                        return Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [avaterB, bodyMessage]);
                      }
                    }),
              ),
              Expanded(
                flex: enableButton ? 2 : 1,
                child: Container(
                  color: Color.fromRGBO(240, 255, 255, 0.9),
                  child: textInput,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  int type;
  String msg;
  File img;

  Message({this.type, this.msg});

  Message.fromMessage({this.img});
}
