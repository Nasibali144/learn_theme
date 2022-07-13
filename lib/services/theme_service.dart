import 'package:flutter/material.dart';
import 'package:learn_theme/services/db_service.dart';

class ThemeService extends ChangeNotifier {

  ThemeMode get mode {
    bool isLight = DBService.getData("isLight") ?? true;
    if(isLight) {
      return ThemeMode.light;
    } else {
      return ThemeMode.dark;
    }
  }

  void changeMode() {
    if(mode == ThemeMode.dark) {
      DBService.setData("isLight", true);
    } else {
      DBService.setData("isLight", false);
    }
    notifyListeners();
  }
}