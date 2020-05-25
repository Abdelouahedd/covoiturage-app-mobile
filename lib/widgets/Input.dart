import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  Input(this.hint, this.iconType,this.margin, this.controller);
  final String hint;
  final TextEditingController controller;
  final IconData iconType;
  final double margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.2,
      height: 45,
      margin: EdgeInsets.only(top: margin),
      padding: EdgeInsets.only(top: 4, left: 16, right: 16, bottom: 4),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(50)),
          color: Colors.white,
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)]),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          icon: Icon(
            iconType,
            color: Colors.blue[600],
          ),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.blue),
          errorStyle: TextStyle(color: Colors.red),
        ),
        style: TextStyle(color: Colors.blue[700]),
      ),
    );
  }
}
