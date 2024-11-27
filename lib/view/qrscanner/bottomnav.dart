import 'package:app_ecom/view/qrscanner/generate_qr_code.dart';
import 'package:app_ecom/view/qrscanner/qr_history_scrn.dart';
import 'package:app_ecom/view/qrscanner/qr_scanner_scrn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_ecom/controller/theme_controller.dart';

class BottomNavController extends GetxController {
  var currentIndex =
      0.obs; // Reactive variable to hold the index of the current screen
}

final themeController = Get.put(ThemeController());

class BottomNavScreen extends StatelessWidget {
  const BottomNavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Controller for managing bottom navigation index
    final BottomNavController controller = Get.put(BottomNavController());

    return Scaffold(
      body: Obx(() => IndexedStack(
            index: controller.currentIndex.value,
            children: [
              QRGenerator(),
              QRScanView(),
              HistoryView(),
            ],
          )),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: controller.currentIndex.value,
        onTap: (index) {
          controller.currentIndex.value = index;
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_2),
            label: 'Generate',
          ),
          BottomNavigationBarItem(
            icon: Obx(() {
              final isDarkMode =
                  themeController.themeMode.value == ThemeMode.dark;

              return Container(
                margin: EdgeInsets.only(top: 10),
                height: 64,
                width: 64,
                child: FloatingActionButton(
                  onPressed: () {
                    controller.currentIndex.value == 1;
                  },
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100),
                      side: BorderSide(
                          width: 3,
                          color: isDarkMode ? Colors.black : Colors.white)),
                  elevation: 0,
                  backgroundColor: isDarkMode ? Colors.yellow : Colors.grey,
                  child:
                      Icon(Icons.qr_code_scanner_rounded, color: Colors.black),
                ),
              );
            }),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
