// ignore: file_names
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/screens/home_screen.dart';
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late Animation animation;
  late Animation animation2;
  late AnimationController controller;
  late AnimationController controller2;
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen()
          ));
     
    });
    controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    controller2 =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    animation = Tween(begin: 0.0, end: 20.0).animate(controller);
    animation2 = Tween(begin: 0.0, end: 230.0).animate(controller2);
    controller2.addListener(() {
      setState(() {});
    });
    controller.addListener(() {
      setState(() {});
    });
    controller.forward();
    controller2.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                   Colors.deepOrange,
                  Color.fromRGBO(241, 161, 64, 1)],
                end: Alignment.bottomLeft,
                begin: Alignment.topRight
                )),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 10,
            ),
            Text(
              "Food Welcomes you",
              style: TextStyle(
                  fontSize: animation.value,
                  color: Colors.white,
                  fontWeight: FontWeight.w800),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }
 @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }
}

