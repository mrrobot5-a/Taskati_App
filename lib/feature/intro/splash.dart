// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/images/intro.json',
              width: 300,
              height: 300,
              fit: BoxFit.fill,
            ),
            Text(
              "Taskati",
              style: TextStyle(
                color: AppColor.black,
                fontFamily: "poppins",
                fontSize: 32,
              ),
            ),
            Text(
              "It's Time To Be Organized",
              style: TextStyle(
                color: AppColor.grey,
                fontFamily: "poppins",
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
