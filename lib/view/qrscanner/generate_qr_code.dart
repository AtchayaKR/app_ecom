import 'package:app_ecom/controller/qr_controller.dart';
import 'package:app_ecom/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:app_ecom/view/qrscanner/qr_history_scrn.dart';
import 'package:app_ecom/view/qrscanner/qr_scanner_scrn.dart';

class QRGenerator extends StatelessWidget {
  final RxInt selectedIndex = 1.obs;
   QRGenerator({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();
    final controller = Get.put(QRController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Generate QRCode'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              Obx(() {
                final isDarkMode =
                    themeController.themeMode.value == ThemeMode.dark;
                return QrImageView(
                  data: controller.qrCode.value,
                  size: 200,
                  backgroundColor: isDarkMode ? Colors.white : Colors.black,
                  eyeStyle: QrEyeStyle(
                    eyeShape: QrEyeShape.square,
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                  dataModuleStyle: QrDataModuleStyle(
                    dataModuleShape: QrDataModuleShape.square,
                    color: isDarkMode ? Colors.black : Colors.white,
                  ),
                );
              }),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  labelText: 'QR Code',
                ),
                keyboardType: TextInputType.text,
                controller: controller.qrContentEditingController,
                onChanged: (val) {
                  controller.qrCode.value = val;
                },
              ),
            ],
          ),
        ),
      ),
       floatingActionButton: FloatingActionButton(
          onPressed: () {
            selectedIndex.value = 1;
          },
          backgroundColor: Colors.yellow,
          child:
              const Icon(Icons.qr_code_scanner_outlined, color: Colors.black),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BottomNavigationBar(
            backgroundColor: Colors.grey[850],
            selectedItemColor: Colors.amber,
            unselectedItemColor: Colors.white,
            currentIndex: selectedIndex.value,
            onTap: (index) {
              selectedIndex.value = index;
              if (index == 0) {
                Get.to(() => QRGenerator()); // Navigate to QR Generator
              } else if (index == 1) {
                Get.to(() => QRScanView()); // Navigate to QR Scanner
              } else if (index == 2) {
                Get.to(() => HistoryView()); // Navigate to History
              }
            },
            items:  [
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: 'Generate QR',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code, color:Colors.grey[850]),
                label: '',
            
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history),
                label: 'History',
              ),
            ],
          ),
        ),
    );
  }
}
