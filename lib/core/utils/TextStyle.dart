import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle getTitle({Color? color, double? fontsize, FontWeight? fontweight}) {
  return TextStyle(
    color: AppColor.black ?? color,
    fontFamily: "poppins",
    fontSize: fontsize ?? 40,
    fontWeight: fontweight ?? FontWeight.bold,
  );
}

TextStyle getSmallTitle(
    {Color? color, double? fontsize, FontWeight? fontweight}) {
  return TextStyle(
    color: AppColor.grey ?? color,
    fontFamily: "poppins",
    fontSize: fontsize ?? 18,
    fontWeight: fontweight ?? FontWeight.w300,
  );
}
