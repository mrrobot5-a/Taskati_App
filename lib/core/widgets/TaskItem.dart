import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/services/app_local_storage.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:gap/gap.dart';

import '../model/TaskModel.dart';

class TaskItem extends StatelessWidget {
  final TaskModel taskModel;
  const TaskItem({
    required this.taskModel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5),
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: taskModel.selectedcolor == -2
              ? Colors.grey
              : taskModel.selectedcolor == -1
                  ? Colors.green
                  : taskModel.selectedcolor == 0
                      ? AppColor.primary
                      : taskModel.selectedcolor == 1
                          ? AppColor.orange
                          : AppColor.red),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    taskModel.title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamily.fontFamilyName,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.timelapse_outlined,
                        color: AppColor.white,
                      ),
                      Gap(10),
                      //Time
                      Text(
                        "${taskModel.startTime} - ${taskModel.endTime}",
                        style: TextStyle(
                          fontFamily: FontFamily.fontFamilyName,
                          color: AppColor.white,
                        ),
                      ),
                    ],
                  ),
                  Gap(10),
                  Text(
                    taskModel.note,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontFamily: FontFamily.fontFamilyName,
                      color: AppColor.white,
                      fontSize: 19,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ],
              ),
            ),
            Gap(10),
            Container(
              width: 1,
              height: 90,
              decoration: BoxDecoration(
                color: AppColor.white,
              ),
            ),
            Gap(5),
            RotatedBox(
              quarterTurns: 3,
              child: Text(
                taskModel.isCompleted ? "COMPLETED" : "TODO",
                style: TextStyle(
                  fontFamily: FontFamily.fontFamilyName,
                  color: AppColor.white,
                  fontSize: 17,
                  fontWeight: FontWeight.w800,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
