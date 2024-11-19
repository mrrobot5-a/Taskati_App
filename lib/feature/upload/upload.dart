// ignore_for_file: prefer_const_constructors

import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/functions/dialogs.dart';
import 'package:flutter_application_1/core/functions/navigation.dart';
import 'package:flutter_application_1/core/services/app_local_storage.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';

import '../../core/widgets/customButton.dart';
import '../Screens/Homepage.dart';

class UploadScreen extends StatefulWidget {
  const UploadScreen({super.key});

  @override
  State<UploadScreen> createState() => _UploadScreenState();
}

class _UploadScreenState extends State<UploadScreen> {
  String? path;
  String name = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColor.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextButton(
              onPressed: () async {
                if (name.isEmpty && path == null) {
                  showErrorMessage(
                      context, "Please enter a name and Select an Image");
                } else if (name.isEmpty && path != null) {
                  showErrorMessage(context, "Please enter a name");
                } else if (name.isNotEmpty && path == null) {
                  showErrorMessage(context, "Please Select an Image");
                } else {
                  //* cache the data
                  AppLocalStorage.cacheDate(AppLocalStorage.namekey, name);
                  AppLocalStorage.cacheDate(AppLocalStorage.imageKey, path);
                  AppLocalStorage.cacheDate(AppLocalStorage.isUpload, true);

                  pushReplacement(context, HomePage());
                }
              },
              child: Text(
                "Done",
                style: TextStyle(
                    fontSize: 20,
                    color: AppColor.primary,
                    fontFamily: FontFamily.fontFamilyName),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 80,
                backgroundColor: AppColor.primary,
                backgroundImage: path != null
                    ? FileImage(File(path!)) // Use FileImage for dynamic image
                    : AssetImage("assets/images/person.png") as ImageProvider,
              ),
              Gap(20),
              CustomButton(
                text: "Upload From Camera",
                onPressed: () async {
                  await uploadImage(isCamera: true);
                },
              ),
              Gap(15),
              CustomButton(
                onPressed: () async {
                  await uploadImage(isCamera: false);
                },
                text: "Upload From Gallery",
                color: AppColor.primary,
              ),
              Gap(20),
              Divider(
                color: AppColor.primary,
                indent: 30,
                endIndent: 30,
                thickness: 1,
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextFormField(
                  cursorColor: AppColor.primary, // Set cursor color
                  cursorWidth: 2.0, // Adjust cursor width
                  cursorHeight: 24.0, // Adjust cursor height (optional)
                  cursorRadius: Radius.circular(5), // Make cursor rounded
                  showCursor: true, // Ens
                  decoration: InputDecoration(
                    hintText: "Name ",
                    hintStyle: TextStyle(
                        color: AppColor.primary,
                        fontFamily: FontFamily.fontFamilyName),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                      child: Icon(
                        Icons.person,
                        color: AppColor.primary,
                        size: 24,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                      borderSide: BorderSide(
                        color: AppColor.primary,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColor.primary,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColor.red,
                      ),
                    ),
                    focusedErrorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(
                        color: AppColor.red,
                      ),
                    ),
                  ),
                  onChanged: (value) {
                    setState(
                      () {
                        name = value;
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

  uploadImage({required bool isCamera}) async {
    await ImagePicker()
        .pickImage(source: isCamera ? ImageSource.camera : ImageSource.gallery)
        .then((value) {
      if (value != null) {
        setState(() {
          path = value.path;
        });
      }
    });
  }
}
