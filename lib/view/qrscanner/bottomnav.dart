import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_ecom/view/qrscanner/generate_qr_code.dart';
import 'package:app_ecom/view/qrscanner/qr_scanner_scrn.dart';
import 'package:app_ecom/view/qrscanner/qr_history_scrn.dart';
import 'package:app_ecom/controller/theme_controller.dart';

class BottomNavController extends GetxController {
  var currentIndex = 1.obs;
}

final themeController = Get.find<ThemeController>();

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final BottomNavController controller = Get.put(BottomNavController());
    final ThemeController themeController = Get.find<ThemeController>();

    return Obx(() {
      final isDarkMode = themeController.themeMode.value == ThemeMode.dark;

      return Scaffold(
        body: IndexedStack(
          index: controller.currentIndex.value,
          children: [
            QRGenerator(),
            QRScanView(),
            HistoryView(),
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Container(
          margin: const EdgeInsets.only(left: 30),
          height: 74,
          width: 74,
          child: FloatingActionButton(
            onPressed: () {
              controller.currentIndex.value = 1; // Navigate to QR Scanner
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(100),
              side: BorderSide(
                width: 3,
                color: isDarkMode ? Colors.black : Colors.white,
              ),
            ),
            elevation: 0,
            backgroundColor: Colors.yellow,
            child:
                const Icon(Icons.qr_code_scanner_rounded, color: Colors.black),
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
          child: BottomAppBar(
            color: isDarkMode
                ? const Color.fromARGB(255, 34, 34, 34)
                : Colors.grey[300],
            shape: const CircularNotchedRectangle(),
            // notchMargin: 2.0,
            child: Container(
              height: 60,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {
                      controller.currentIndex.value =
                          0; // Navigate to Generator
                    },
                    iconSize: 40,
                    icon: Icon(
                      Icons.qr_code_2,
                      color: controller.currentIndex.value == 0
                          ? Colors.yellow
                          : Colors.grey,
                    ),
                  ),
                  const SizedBox(width: 48),
                  IconButton(
                    iconSize: 40,
                    onPressed: () {
                      controller.currentIndex.value = 2; // Navigate to History
                    },
                    icon: Icon(
                      Icons.history,
                      color: controller.currentIndex.value == 2
                          ? Colors.yellow
                          : Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
