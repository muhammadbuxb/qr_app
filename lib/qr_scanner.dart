import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScannerPage extends StatefulWidget {
  const QRScannerPage({super.key});

  @override
  State<QRScannerPage> createState() => _QRScannerPageState();
}

class _QRScannerPageState extends State<QRScannerPage> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter QR App',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Container(
                margin: EdgeInsets.only(top:40),
                width: Get.width-100,
                height: Get.width-150,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30)
                ),
                child: QRView(
                  overlayMargin: EdgeInsets.fromLTRB(20, 30, 20, 30),
                          key: qrKey,
                          onQRViewCreated: onQRViewCamera,
                        ),
              )),
          Expanded(
              child: Center(
            child: (result != null)
                ? InkWell(
                  onTap:() {
                  Clipboard.setData(ClipboardData(text:'${result!.code} '));
                },
                  child: Text('Data : ${result!.code}', style: TextStyle(fontSize: 18),))
                : Text('Scan QR Code', style: TextStyle(fontSize: 18),),
          )),
        ],
      ),
    );
  }

  void onQRViewCamera(QRViewController controller) {
    this.controller = controller;
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
