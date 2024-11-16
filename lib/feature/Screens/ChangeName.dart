// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:flutter_application_1/core/widgets/customButton.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/services/app_local_storage.dart';

class ChangeName extends StatefulWidget {
  const ChangeName({super.key});

  @override
  State<ChangeName> createState() => _ChangeNameState();
}

class _ChangeNameState extends State<ChangeName> {
  String? path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.sunny,
                size: 32,
                color: AppColor.primary,
              ),
            ),
          ),
        ],
        leading: Padding(
          padding: const EdgeInsets.all(6.0),
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back,
              size: 24,
              color: AppColor.primary,
            ),
          ),
        ),
        backgroundColor: AppColor.white,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    context: context,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Gap(15),
                            CustomButton(
                              width: double.infinity,
                              onPressed: () async {
                                await uploadImage(isCamera: false);
                              },
                              text: "Upload From Camera ",
                            ),
                            Gap(15),
                            CustomButton(
                              width: double.infinity,
                              onPressed: () async {
                                await uploadImage(isCamera: false);
                              },
                              text: "Upload From Gallery ",
                            ),
                            Gap(15),
                          ],
                        ),
                      );
                    });
              },
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 80,
                    backgroundColor: AppColor.primary,
                    backgroundImage: FileImage(
                      File(
                        AppLocalStorage.getCachedData(AppLocalStorage.imageKey),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: AppColor.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        size: 28,
                        Icons.camera_alt,
                        color: AppColor.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Gap(30),
            Divider(
              thickness: 1,
              color: AppColor.primary,
              indent: 30,
              endIndent: 30,
            ),
            Gap(30),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${AppLocalStorage.getCachedData('name')}",
                    style: TextStyle(
                      fontFamily: FontFamily.fontFamilyName,
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: AppColor.primary,
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        color: AppColor.primary,
                      ),
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.edit,
                        size: 28,
                        color: AppColor.primary,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  uploadImage({required bool isCamera}) async {
    await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        AppLocalStorage.cacheDate(AppLocalStorage.imageKey, value.path);

        setState(() {});
      }
      Navigator.pop(context);
    });
  }
}
