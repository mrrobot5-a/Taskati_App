// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/services/app_local_storage.dart';
import 'package:flutter_application_1/core/utils/TextStyle.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:flutter_application_1/core/widgets/DateButton.dart';
import 'package:flutter_application_1/core/widgets/appBarHome.dart';
import 'package:flutter_application_1/core/widgets/todayHeader.dart';
import 'package:gap/gap.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              AppBarHome(),
              TodayHeader(),
              Gap(20),
              DatePicker(
                width: 80,
                height: 100,
                DateTime.now(),
                initialSelectedDate: DateTime.now(),
                selectionColor: AppColor.primary,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
