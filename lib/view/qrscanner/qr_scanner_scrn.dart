import 'package:app_ecom/bottom_navigation.dart';
import 'package:app_ecom/controller/qr_controller.dart';
import 'package:app_ecom/view/qrscanner/generate_qr_code.dart';
import 'package:app_ecom/view/qrscanner/qr_history_scrn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanView extends StatelessWidget {
  final QRController controller = Get.put(QRController());
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final RxInt selectedIndex = 1.obs;

  QRScanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        appBar: AppBar(
          title: const Text('QR Scanner'),
          leading: IconButton(
            onPressed: () {
              Get.offAll(const BottomNav()); // no previous route exists
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 4,
              child: QRView(
                key: qrKey,
                onQRViewCreated: (QRViewController qrController) {
                  qrController.scannedDataStream.listen((scanData) {
                    controller.processScannedQRCode(scanData.code!);
                    qrController.pauseCamera(); // Pause scanning after success
                    Get.snackbar(
                      'QR Code Scanned',
                      'Result: ${scanData.code}',
                      snackPosition: SnackPosition.BOTTOM,
                    );
                  });
                },
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Obx(() => Text(
                      controller.scanResult.value.isEmpty
                          ? 'Scan a QR code to see results here.'
                          : 'Last Scan: ${controller.scanResult.value}',
                      style: const TextStyle(fontSize: 16, color: Colors.black),
                    )),
              ),
            ),
          ],
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
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.grey[850],
          selectedItemColor: Colors.amber,
          unselectedItemColor: Colors.white,
          currentIndex: selectedIndex.value,
          onTap: (index) {
            selectedIndex.value = index;
            if (index == 0) {
              Get.to(() => const QRGenerator()); // Navigate to QR Generator
            } else if (index == 1) {
              Get.to(() => QRScanView()); // Navigate to QR Scanner
            } else if (index == 2) {
              Get.to(() => HistoryView()); // Navigate to History
            }
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner),
              label: 'Generate QR',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'Scanner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              label: 'History',
            ),
          ],
        ),
      );
    });
  }
}
