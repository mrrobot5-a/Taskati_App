import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/utils/colors.dart';

showErrorMessage(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: SizedBox(
      height: 40,
      child: Center(
        child: Text(
          message,
          style: TextStyle(
            fontFamily: FontFamily.fontFamilyName,
            fontSize: 16,
          ),
        ),
      ),
    ),
    backgroundColor: AppColor.red,
    duration: const Duration(seconds: 3),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      topRight: Radius.circular(20),
    )),
  ));
}
