import 'package:app_ecom/controller/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app_ecom/view/qrscanner/generate_qr_code.dart';
import 'package:app_ecom/view/qrscanner/qr_scanner_scrn.dart';

class HistoryView extends StatelessWidget {
  final QRController controller = Get.put(QRController());
  final RxInt selectedIndex = 1.obs;
  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('History'),
          actions: [Icon(Icons.menu)],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: ClipRRect(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              child: Container(
                height: 40,
                margin: EdgeInsets.symmetric(horizontal: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  color: Colors.yellow,
                ),
                child: TabBar(
                  tabs: const [
                    Tab(text: 'Scan'),
                    Tab(text: 'Create'),
                  ],
                  indicatorSize: TabBarIndicatorSize.tab,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.yellow),
                      labelColor: Colors.black,
                      unselectedLabelColor: Colors.grey,
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: TabBarView(
            children: [
              // Tab 1: Scan History
              Obx(() {
                if (controller.history.isEmpty) {
                  return const Center(child: Text('No history yet.'));
                }
                return ListView.builder(
                  itemCount: controller.history.length,
                  itemBuilder: (context, index) {
                    final item = controller.history[index];
                    return ListTile(
                      leading: const Icon(Icons.qr_code_scanner_outlined),
                      title: Text(item['data'] ?? ''),
                      subtitle: Text(item['time'] ?? ''),
                      trailing: const Icon(Icons.delete),
                      onTap: () => controller.history.removeAt(index),
                    );
                  },
                );
              }),
              // Tab 2: Create QR Code
              Center(
                child: ElevatedButton(
                  onPressed: () {},
                  child: const Text('Create QR Code'),
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
      ),
    );
  }
}
