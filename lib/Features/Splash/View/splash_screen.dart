import 'dart:async';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/Extentions/string_extention.dart';
import 'package:flutter_test_app/Features/LocalStorage/storage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 4), () {
      LocalStorage.checkToken(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context).width;
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("splash.jpg".imagePath), fit: BoxFit.fill)),
        child: Center(
          child: FadeIn(
              duration: Duration(seconds: 3),
              child: Image.asset(
                "logo.png".imagePath,
                height: size * .4,
                width: size * .4,
              )),
        ),
      ),
    );
  }
}
