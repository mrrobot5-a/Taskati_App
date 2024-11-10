// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/app_local_storage.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:flutter_application_1/core/widgets/customButton.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../utils/TextStyle.dart';

class TodayHeader extends StatelessWidget {
  const TodayHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('dd MMM, yyyy').format(DateTime.now()),
                style: getTitle(
                  fontsize: 20,
                  color: AppColor.black,
                  fontweight: FontWeight.w900,
                ),
              ),
              Text(
                "Today",
                style: getSmallTitle(
                  color: AppColor.black,
                  fontweight: FontWeight.w900,
                ),
              ),
            ],
          ),
          Spacer(),
          CustomButton(
            onPressed: () {},
            text: "+ Add Task",
            fontWeight: FontWeight.w500,
            fontSize: 18,
            width: 140,
            height: 50,
          )
        ],
      ),
    );
  }
}
