import 'package:flutter/material.dart';

import 'package:qr_scanner_app/utils/app_theme.dart';


class GenerateQrScanner extends StatelessWidget {
  const GenerateQrScanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text(
          "Generate QR",
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 22,
            letterSpacing: 2,
          ),
        ),
      ),
    );
  }
}
