import 'package:app_ecom/controller/qr_controller.dart';
import 'package:app_ecom/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

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
    );
  }
}
