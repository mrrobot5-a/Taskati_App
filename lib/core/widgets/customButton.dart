// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  String? text;
  Color? color;
  double? width;
  double? height;
  double? fontSize;
  FontWeight? fontWeight;
  final Function() onPressed;
  CustomButton({
    required this.onPressed,
    required this.text,
    this.color,
    this.height,
    this.width,
    this.fontSize,
    this.fontWeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? 260,
      height: height ?? 50,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            // elevation: 5,
            // shadowColor: AppColor.primary,
            backgroundColor: color ?? AppColor.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          onPressed: onPressed,
          child: Text(
            text!,
            style: TextStyle(
              fontSize: fontSize ?? 20,
              fontFamily: "poppins",
              fontWeight: fontWeight ?? FontWeight.bold,
            ),
          )),
    );
  }
}
