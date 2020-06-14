import 'package:flutter/material.dart';

@immutable
class MyButton extends StatelessWidget {
  MyButton(this.name, this.withSize, this.click);
  final String name;
  final double withSize;
  Function click;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: click,
      child: Container(
        height: 45,
        width: MediaQuery.of(context).size.width / withSize,
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.blue,
                Colors.blue[300],
              ],
            ),
            borderRadius: BorderRadius.all(Radius.circular(50))),
        child: Center(
          child: Text(
            name.toUpperCase(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
