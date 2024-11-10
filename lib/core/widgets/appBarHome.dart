import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/services/app_local_storage.dart';
import 'package:flutter_application_1/core/utils/colors.dart';

import '../utils/TextStyle.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hello, ${AppLocalStorage.getCachedData('name')}",
              style: getTitle(
                fontsize: 24,
                color: AppColor.primary,
                fontweight: FontWeight.w900,
              ),
            ),
            Text(
              "Have A Nice Day.",
              style: getSmallTitle(
                color: AppColor.black,
                fontweight: FontWeight.w500,
              ),
            ),
          ],
        ),
        Spacer(),
        CircleAvatar(
          radius: 30,
          //logic of background image
          backgroundImage:
              AppLocalStorage.getCachedData(AppLocalStorage.imageKey) != null
                  ? FileImage(File(AppLocalStorage.getCachedData(AppLocalStorage
                      .imageKey)!)) // Use FileImage for dynamic image
                  : AssetImage("assets/images/person.png") as ImageProvider,
        ),
      ],
    );
  }
}