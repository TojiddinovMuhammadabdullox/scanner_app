import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_app/views/widgets/camera_size.dart';
import 'package:qr_scanner_app/controllers/qr_controller.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final QRController controller = Get.put(QRController());

    return Obx(() {
      return Stack(
        children: [
          QRView(
            key: controller.qrKey,
            onQRViewCreated: controller.onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderColor: const Color(0xffFDB623),
              borderRadius: 10,
              borderLength: 30,
              borderWidth: 10,
              cutOutSize: controller.cutOutSize.value,
            ),
          ),
          ResizableOverlay(
            initialSize: controller.cutOutSize.value,
            onSizeChanged: (newSize) {
              controller.updateCutOutSize(newSize);
            },
          ),
        ],
      );
    });
  }
}
