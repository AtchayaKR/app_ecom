import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  var themeMode = ThemeMode.light.obs; //initially in light mode

  // Light theme
  final lightTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: Colors.grey[100],
  );

  // Dark theme
  final darkTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: Colors.black,
  );

  // Toggle switch
  void toggleTheme() {
    themeMode.value =
        themeMode.value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}
