import 'package:app_ecom/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Searchbar extends StatelessWidget {
  const Searchbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      
      final isDarkMode = themeController.themeMode.value == ThemeMode.dark;

      return TextField(
        style: const TextStyle(fontSize: 14),
        cursorColor: Colors.black,
        decoration: InputDecoration(
            prefixIcon: const Icon(
              Icons.search,
            ),
            suffixIcon: const Icon(
              Icons.mic,
              color: Colors.grey,
            ),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25),
                borderSide: BorderSide.none),
            hintText: "Search",
            filled: true,
            fillColor:isDarkMode ? const Color.fromARGB(255, 34, 34, 34) : Colors.white,),
      );
    });
  }
}
