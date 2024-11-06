import 'package:flutter/material.dart';

//!Push
pushTo(BuildContext context, Widget newScreen) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
  );
}

//!PushReplacement
pushReplacement(BuildContext context, Widget newScreen) {
  Navigator.pushReplacement(
    context,
    MaterialPageRoute(builder: (context) => newScreen),
  );
}
