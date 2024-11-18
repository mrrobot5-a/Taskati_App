// ignore_for_file: prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/model/TaskModel.dart';
import 'package:flutter_application_1/core/services/app_local_storage.dart';
import 'package:flutter_application_1/core/widgets/custom_text_field.dart';
import 'package:flutter_application_1/feature/Screens/Homepage.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

import '../../core/functions/navigation.dart';
import '../../core/utils/colors.dart';
import '../../core/widgets/customButton.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({super.key});

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  @override
  var formKey = GlobalKey<FormState>();
  int selectedColor = 0;
  var titleController = TextEditingController();
  var noteController = TextEditingController();
  var dateController = TextEditingController(
    text: DateFormat('dd/MM/yyyy').format(DateTime.now()),
  );
  var startTimeController = TextEditingController(
    text: DateFormat('hh:mm').format(DateTime.now()),
  );
  var endTimeController = TextEditingController(
    text: DateFormat('hh:mm').format(DateTime.now()),
  );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.white,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: AppColor.primary,
            size: 25,
          ),
        ),
        title: Text(
          'Add Task',
          style: TextStyle(
            fontFamily: FontFamily.fontFamilyName,
            color: AppColor.primary,
            fontSize: 23,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title",
                  style: TextStyle(
                    fontFamily: FontFamily.fontFamilyName,
                    color: AppColor.primary,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gap(5),
                CustomTextFromField(
                  validatorFunction: (value) {
                    if (value == null || value.isEmpty) {
                      return "Title is required";
                    }
                    return null;
                  },
                  controller: titleController,
                ),
                Gap(20),
                Text(
                  "Note",
                  style: TextStyle(
                    fontFamily: FontFamily.fontFamilyName,
                    color: AppColor.primary,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gap(5),
                CustomTextFromField(
                  // validatorFunction: (value) {
                  //   if (value == null || value.isEmpty) {
                  //     return "Title is required";
                  //   }
                  //   return null;
                  // },
                  controller: noteController,
                  maxlines: 4,
                  noteText: "Enter Note Here",
                ),
                Gap(20),
                Text(
                  "Date",
                  style: TextStyle(
                    fontFamily: FontFamily.fontFamilyName,
                    color: AppColor.primary,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Gap(15),
                TextFormField(
                  onTap: () {
                    showDatePicker(
                            builder: (context, child) {
                              return Theme(
                                data: ThemeData.light().copyWith(
                                  colorScheme: ColorScheme.light(
                                      primary: AppColor.primary),
                                ),
                                child: child!,
                              );
                            },
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050))
                        .then((value) {
                      if (value != null) {
                        dateController.text =
                            DateFormat('dd/MM/yyyy').format(value);
                      }
                    });
                  },
                  controller: dateController,
                  readOnly: true,
                  // onChanged: (value) {
                  //   // Handle title input
                  // },
                  decoration: InputDecoration(
                    suffixIcon: Icon(
                      Icons.calendar_month_rounded,
                    ),
                    suffixIconColor: AppColor.primary,
                    labelText: "Date",
                    alignLabelWithHint: true,
                    labelStyle: TextStyle(
                      fontFamily: FontFamily.fontFamilyName,
                      color: AppColor.primary,
                      fontSize: 18,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColor.grey,
                        width: 1.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColor.primary,
                        width: 1.0,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColor.red,
                        width: 1.0,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(
                        color: AppColor.red,
                        width: 1.0,
                      ),
                    ),
                  ),
                ),
                Gap(20),
                Row(
                  children: [
                    Expanded(
                      child: CustomTextFromField(
                        onTap: () {
                          showTimePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: ColorScheme.light(
                                            primary: AppColor.primary),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              startTimeController.text = value.format(context);
                            }
                          });
                        },
                        controller: startTimeController,
                        isReadOnly: true,
                        suffixIcons: Icon(
                          Icons.timer_outlined,
                        ),
                      ),
                    ),
                    Gap(10),
                    Expanded(
                      child: CustomTextFromField(
                        onTap: () {
                          showTimePicker(
                                  builder: (context, child) {
                                    return Theme(
                                      data: ThemeData.light().copyWith(
                                        colorScheme: ColorScheme.light(
                                            primary: AppColor.primary),
                                      ),
                                      child: child!,
                                    );
                                  },
                                  context: context,
                                  initialTime: TimeOfDay.now())
                              .then((value) {
                            if (value != null) {
                              endTimeController.text = value.format(context);
                            }
                          });
                        },
                        controller: endTimeController,
                        isReadOnly: true,
                        suffixIcons: Icon(
                          Icons.timer,
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(20),
                Text(
                  "Color",
                  style: TextStyle(
                    fontFamily: FontFamily.fontFamilyName,
                    color: AppColor.primary,
                    fontSize: 23,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Row(
                  children: [
                    Row(
                      children: List.generate(
                        3,
                        (index) {
                          return Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColor = index;
                                });
                              },
                              child: CircleAvatar(
                                radius: 20,
                                backgroundColor: index == 0
                                    ? AppColor.primary
                                    : index == 1
                                        ? AppColor.orange
                                        : AppColor.red,
                                child: (selectedColor == index)
                                    ? Icon(
                                        Icons.check,
                                        color: AppColor.white,
                                      )
                                    : null,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Spacer(),
                    CustomButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          String id =
                              DateTime.now().toString() + titleController.text;
                          AppLocalStorage.cacheTaskDate(
                            id,
                            TaskModel(
                                id: id,
                                selectedcolor: selectedColor,
                                title: titleController.text,
                                note: noteController.text,
                                date: dateController.text,
                                startTime: startTimeController.text,
                                endTime: endTimeController.text,
                                isCompleted: false),
                          );
                          pushReplacement(context, HomePage());
                          // print(
                          // AppLocalStorage.getCachedTaskData(id)?.title ?? " ");
                        }
                      },
                      text: "Create Task",
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      width: 140,
                      height: 50,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
