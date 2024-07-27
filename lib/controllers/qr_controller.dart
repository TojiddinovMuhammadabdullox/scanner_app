import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_scanner_app/views/screens/result_screen.dart';

class QRController extends GetxController {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var cutOutSize = 200.0.obs;
  QRViewController? controller;

  // Observable to track scanning status
  var isScanning = true.obs;

  // Observable list to store scanned data
  var scannedDataList = <String>[].obs;

  void onQRViewCreated(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      isScanning.value =
          false; // Set scanning status to false when a QR code is scanned
      controller.pauseCamera();
      // Add scanned data to the list
      scannedDataList.add(scanData.code ?? 'No data');
      // Navigate to the result screen if needed
      Get.to(() => ResultScreen(result: scanData.code ?? 'No data'));
    });
  }

  void toggleFlash() {
    controller?.toggleFlash();
  }

  void flipCamera() {
    controller?.flipCamera();
  }

  void updateCutOutSize(double newSize) {
    cutOutSize.value = newSize;
  }

  @override
  void onInit() {
    super.onInit();
    if (Platform.isAndroid) {
      controller?.resumeCamera();
    } else if (Platform.isIOS) {
      controller?.resumeCamera();
    }
  }

  @override
  void onClose() {
    controller?.dispose();
    super.onClose();
  }
}
