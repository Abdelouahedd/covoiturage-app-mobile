import 'dart:async';
import 'dart:io';
import 'package:covoiturage_app/screens/SignIn.dart';
import 'package:covoiturage_app/widgets/animatedRoute.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  BoxFit logo = BoxFit.contain;
  Timer _timer;
  var si = 0.0;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  @override
  void dispose() {
    super.dispose();
    _timer.cancel();
  }

  startAnimation() async {
    const oneSec = const Duration(seconds: 1);
    var start = 8;
    _timer = new Timer.periodic(oneSec, (Timer timer) {
      if (mounted) {
        this.setState(() {
          si += 0.1;
        });
      }
      if (start == 0) {
        sleep(Duration(seconds: 2));
        goToLoginPage();
      }

      start -= 1;
    });
  }

  void goToLoginPage() {
    Navigator.pushReplacement(context, SlideRightRoute(page: SignIn()));
  }

  @override
  Widget build(cnx) {
    return Scaffold(
        body: Container(
      decoration: new BoxDecoration(color: Colors.white10),
      child: Center(
        child: Opacity(
          opacity: si,
          child: new Container(
            width: MediaQuery.of(context).size.width / 2,
            alignment: Alignment.center,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new ExactAssetImage('assets/images/logodinimak.png',
                    scale: 0.5),
                fit: logo,
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
