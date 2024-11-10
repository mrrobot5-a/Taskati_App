import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:intl/intl.dart';

class DataButton extends StatefulWidget {
  const DataButton({
    super.key,
  });

  @override
  State<DataButton> createState() => _DataButtonState();
}

class _DataButtonState extends State<DataButton> {
  Color colorOfButton = AppColor.white;
  Color colorOfText = AppColor.black;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          colorOfButton = AppColor.primary;
          colorOfText = AppColor.white;
        });
      },
      child: Container(
        width: 110,
        height: 130,
        decoration: BoxDecoration(
          color: colorOfButton,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                DateFormat('MMM').format(DateTime.now()).toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  color: colorOfText,
                  fontFamily: FontFamily.fontFamilyName,
                ),
              ),
              Text(
                DateFormat.M().format(DateTime.now()).toUpperCase(),
                style: TextStyle(
                  fontSize: 35,
                  color: colorOfText,
                  fontFamily: FontFamily.fontFamilyName,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                // DateFormat('').format(DateTime.now()),
                DateFormat.E().format(DateTime.now()).toUpperCase(),
                style: TextStyle(
                  fontSize: 18,
                  color: colorOfText,
                  fontFamily: FontFamily.fontFamilyName,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
