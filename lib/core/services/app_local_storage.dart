import 'package:hive_flutter/hive_flutter.dart';

import '../model/TaskModel.dart';

class AppLocalStorage {
  static late Box userBox;
  static late Box<TaskModel> userTask;
  static String namekey = "name";
  static String imageKey = "image";
  static String isUpload = 'isUpload';
  //init Box
  static init() {
    userBox = Hive.box('user');
    userTask = Hive.box('task');
  }

  //cache Data
  static cacheDate(String key, dynamic name) {
    userBox.put(key, name);
  }

  //get cached data
  static getCachedData(String key) {
    return userBox.get(key);
  }

  //cache Task Data
  static cacheTaskDate(String key, TaskModel value) {
    userTask.put(key, value);
  }

  //get cached Task Data
  static TaskModel? getCachedTaskData(String key) {
    return userTask.get(key);
  }
}
