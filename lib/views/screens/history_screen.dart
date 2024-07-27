import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_scanner_app/controllers/qr_controller.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final QRController controller = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: const Text('History'),
        backgroundColor: Colors.deepPurple,
        elevation: 4,
      ),
      body: Obx(() {
        if (controller.scannedDataList.isEmpty) {
          return const Center(
            child: Text(
              'No scanned data yet.',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          );
        }
        return ListView.separated(
          padding: const EdgeInsets.all(8.0),
          itemCount: controller.scannedDataList.length,
          separatorBuilder: (context, index) =>
              const Divider(height: 20, thickness: 1, color: Colors.grey),
          itemBuilder: (context, index) {
            final result = controller.scannedDataList[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: const EdgeInsets.all(12),
                leading: Icon(Icons.history, color: Colors.deepPurple),
                title: Text(
                  result,
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.w500),
                ),
                subtitle: Text(
                  'Scanned at ${DateTime.now().toLocal().toString().split(' ')[1]}',
                  style: const TextStyle(fontSize: 14, color: Colors.grey),
                ),
                onTap: () {
                  // Action on tap if needed
                },
              ),
            );
          },
        );
      }),
    );
  }
}
