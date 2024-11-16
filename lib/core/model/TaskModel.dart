import 'package:hive/hive.dart';
part 'TaskModel.g.dart';

@HiveType(typeId: 0)
class TaskModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final int selectedcolor;
  @HiveField(2)
  final String title;
  @HiveField(3)
  final String note;
  @HiveField(4)
  final String date;
  @HiveField(5)
  final String startTime;
  @HiveField(6)
  final String endTime;
  @HiveField(7)
  final bool isCompleted;

  TaskModel({
    required this.id,
    required this.selectedcolor,
    required this.title,
    required this.note,
    required this.date,
    required this.startTime,
    required this.endTime,
    required this.isCompleted,
  });
}
