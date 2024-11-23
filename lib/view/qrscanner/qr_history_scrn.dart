import 'package:app_ecom/controller/qr_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryView extends StatelessWidget {
  final QRController controller = Get.put(QRController());

  HistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan History')),
      body: Obx(() {
        if (controller.history.isEmpty) {
          return const Center(child: Text('No history yet.'));
        }

        return ListView.builder(
          itemCount: controller.history.length,
          itemBuilder: (context, index) {
            final item = controller.history[index];
            return ListTile(
              title: Text(item['data'] ?? ''),
              subtitle: Text(item['time'] ?? ''),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: controller.clearHistory,
        child: const Icon(Icons.delete),
      ),
    );
  }
}
