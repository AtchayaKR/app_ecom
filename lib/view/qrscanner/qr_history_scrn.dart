import 'package:app_ecom/controller/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      ),
    );
  }
}
