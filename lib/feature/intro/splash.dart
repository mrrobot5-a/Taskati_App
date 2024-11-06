// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/functions/navigation.dart';
import 'package:flutter_application_1/core/utils/TextStyle.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:flutter_application_1/feature/upload/upload.dart';
import 'package:gap/gap.dart';
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
    Future.delayed(Duration(seconds: 2), () {
      // Navigate to the main app after the splash screen
      pushReplacement(context, UploadScreen());
    });
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
              'assets/images/empty.json',
              width: 400,
              height: 400,
              fit: BoxFit.fill,
            ),
            Text(
              "Taskati",
              style: getTitle(),
            ),
            Gap(10),
            Text(
              "It's Time To Be Organized",
              style: getSmallTitle(),
            ),
          ],
        ),
      ),
    );
  }
}
