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
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../../core/model/TaskModel.dart';
import '../../core/widgets/TaskItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String selectedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 14,
            right: 14,
            bottom: 14,
          ),
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
                onDateChange: (date) {
                  setState(() {
                    selectedDate = DateFormat('dd/MM/yyyy').format(date);
                  });
                  // DateTime.now()
                },
              ),
              Gap(20),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: AppLocalStorage.userTask.listenable(),
                  builder: (context, box, child) {
                    List<TaskModel> tasks = [];
                    box.values.forEach((element) {
                      if (element.date == selectedDate) {
                        tasks.add(element);
                      }
                    });
                    if (tasks.isEmpty) {
                      return Column(
                        children: [
                          Lottie.asset(
                            "assets/images/intro.json",
                            width: 300,
                          ),
                          Text(
                            "No tasks found for ${selectedDate}",
                            style: TextStyle(
                              fontFamily: FontFamily.fontFamilyName,
                              fontSize: 18,
                            ),
                          ),
                        ],
                      );
                    }

                    return ListView.builder(
                      itemCount: tasks.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          onDismissed: (direction) {
                            if (direction == DismissDirection.startToEnd) {
                              //complete Task
                              box.put(
                                tasks[index].id,
                                TaskModel(
                                  id: tasks[index].id,
                                  title: tasks[index].title,
                                  date: tasks[index].date,
                                  isCompleted: true,
                                  note: tasks[index].note,
                                  selectedcolor: -1,
                                  startTime: tasks[index].startTime,
                                  endTime: tasks[index].endTime,
                                ),
                              );
                            } else {
                              box.delete(tasks[index].id);
                              box.put(
                                tasks[index].id,
                                TaskModel(
                                  id: tasks[index].id,
                                  title: tasks[index].title,
                                  date: tasks[index].date,
                                  isCompleted: false,
                                  note: tasks[index].note,
                                  selectedcolor: -2,
                                  startTime: tasks[index].startTime,
                                  endTime: tasks[index].endTime,
                                ),
                              );
                            }
                          },
                          background: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Complete",
                                    style: TextStyle(
                                      fontFamily: FontFamily.fontFamilyName,
                                      fontSize: 24,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.done,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          secondaryBackground: Container(
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: AppColor.red,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    "Delete",
                                    style: TextStyle(
                                      fontFamily: FontFamily.fontFamilyName,
                                      fontSize: 24,
                                      color: AppColor.white,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    Icons.delete,
                                    color: AppColor.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          key: UniqueKey(),
                          child: TaskItem(
                            taskModel: tasks[index],
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
