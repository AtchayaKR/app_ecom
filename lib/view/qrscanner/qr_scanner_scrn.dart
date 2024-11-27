import 'package:app_ecom/bottom_navigation.dart';
import 'package:app_ecom/controller/qr_controller.dart';
import 'package:app_ecom/view/qrscanner/generate_qr_code.dart';
import 'package:app_ecom/view/qrscanner/qr_history_scrn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

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
              Get.offAll(const BottomNav());
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Container(
                  color: Colors.grey,
                  width: 250,
                  height: 120,
                  child: Column(children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.image),
                          Icon(Icons.flash_on),
                          Icon(Icons.flip_camera_ios_outlined),
                        ])
                  ])),
              // scanning logic
              QRView(
                key: qrKey,
                onQRViewCreated: (QRViewController qrController) {
                  qrController.scannedDataStream.listen((scanData) {
                    controller.processScannedQRCode(scanData.code!);
                    //save scanned history
                    controller.saveToHistory(scanData.code!);

                    //3sec delay
                    Future.delayed(const Duration(seconds: 3), () {
                      qrController.resumeCamera();
                    });
                  });
                },
              ),
              // Custom Scanning Box Overlay
              Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // scanning box
                    Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.yellow,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    // Scanning
                    ScanningLine(),
                  ],
                ),
              ),

              Positioned(
                bottom: 20,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    'Place the QR code inside the box',
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  ),
                ),
              ),
            ],
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
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner),
                label: 'Generate QR',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.qr_code, color: Colors.grey[850]),
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
    });
  }
}

//animation for scanning line
class ScanningLine extends StatefulWidget {
  const ScanningLine({super.key});

  @override
  _ScanningLineState createState() => _ScanningLineState();
}

class _ScanningLineState extends State<ScanningLine>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
      upperBound: 1.0,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0, end: 1).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
          top: _animation.value * 250, // line moving
          child: Container(
            width: 250,
            height: 2,
            color: Colors.yellow,
          ),
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
