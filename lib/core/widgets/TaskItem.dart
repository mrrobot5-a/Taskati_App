import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/constants/fontFamily.dart';
import 'package:flutter_application_1/core/utils/colors.dart';
import 'package:gap/gap.dart';

class TaskItem extends StatelessWidget {
  const TaskItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return  Container(
          margin: EdgeInsets.all(5),
          width: double.infinity,
          height: 130,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppColor.primary,
          ),
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
                        "Flutter Task",
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
                            "13:03 AM - 02:40 AM",
                            style: TextStyle(
                              fontFamily: FontFamily.fontFamilyName,
                              color: AppColor.white,
                            ),
                          ),
                        ],
                      ),
                      Gap(10),
                      Text(
                        "Edit Readme about Taskiti Project ",
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
                    "Todo",
                    style: TextStyle(
                      fontFamily: FontFamily.fontFamilyName,
                      color: AppColor.white,
                      fontSize: 19,
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
