import 'package:flutter/material.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController controller;
  Animation<double> animation;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(milliseconds: 1800), vsync: this);

    animation = CurvedAnimation(parent: controller, curve: Curves.bounceOut)
      ..addListener(() {
        setState(() {

        });
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
           pageRoute();
        }
      });
    controller.forward();
  }

  pageRoute() {
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
          child: Text(
        'Covid-19 Tracker',
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.blue,
          fontSize: 30 * animation.value,
        ),
      )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}

//Future startTimer() async {
//    var duration = Duration(seconds: 5);
//    return Timer(duration, () async {
////      Navigator.pushReplacement(
////          context, MaterialPageRoute(builder: (context) => HomeScreen()));
//    });
//  }
