import 'package:app_ecom/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() {
      final isDarkMode = themeController.themeMode.value == ThemeMode.dark;

      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Hello,',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              Text(
                'Hari Prasad',
                style: TextStyle(fontSize: 16),
              )
            ],
          ),
          Stack(
            children: [
              CircleAvatar(
                backgroundColor: isDarkMode ? const Color.fromARGB(255, 34, 34, 34) : Colors.white,
                radius: 25,
                child: const Icon(Icons.shopping_cart_outlined),
              ),
              // Positioned message
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  height: 16,
                  width: 16,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    '5',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      );
    });
  }
}
