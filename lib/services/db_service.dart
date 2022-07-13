import 'package:hive_flutter/hive_flutter.dart';

class DBService {
  static String dbName = "SettingMode";

  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox(dbName);
  }

  static Future<void> setData(String key, dynamic value) async {
    var box = Hive.box(dbName);
    await box.put(key, value);
  }

  static dynamic getData(String key) {
    var box = Hive.box(dbName);
    return box.get(key);
  }

  static Future<void> removeData(String key) async{
    var box = Hive.box(dbName);
    await box.delete(key);
  }

  static Future<void> clearDB() async {
    var box = Hive.box(dbName);
    await box.clear();
  }
}