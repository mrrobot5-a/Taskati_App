import 'package:hive_flutter/hive_flutter.dart';

class AppLocalStorage {
  static late Box userBox;
  static String namekey = "name";
  static String imageKey = "image";
  static String isUpload = 'isUpload';
  //init Box
  static init() {
    userBox = Hive.box('user');
  }

  //cache Data
  static cacheDate(String key, dynamic name) {
    userBox.put(key, name);
  }

  //get cached data
  static getCachedData(String key) {
    return userBox.get(key);
  }
}
//  var box = Hive.box('user');
//  await box.put('name', name);
//  String text = box.get("name");
