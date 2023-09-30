import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRImagePage extends StatelessWidget {
  const QRImagePage({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: Text('Flutter QR App'),
        centerTitle: true,
        
      ),
      body: Center(
        child: QrImageView(
          data: controller.text,
          embeddedImageStyle: QrEmbeddedImageStyle(
          size: Size(200, 200),

          ),
          ),
      ),
    );
  }
}