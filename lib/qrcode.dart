import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_app/qr_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCode extends StatefulWidget {
  const QRCode({super.key});

  @override
  State<QRCode> createState() => _QRCodeState();
}

class _QRCodeState extends State<QRCode> {
  TextEditingController controller = TextEditingController();
  bool showQR = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Flutter QR App',
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), labelText: 'Enter URL'),
              ),
            ),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    print('On press Working');
                    setState(() {
                      showQR = true;
                    });
                  },
                  child: Text('Generate QR Code')),
            ),
            // ElevatedButton(
            //     onPressed: () {
            //      Navigator.push(context,
            //           MaterialPageRoute(builder: (context) => QRScannerPage()));
            //     },
            //     child: Text('Scan QR Code')),
            SizedBox(
                    height: 30,
                  ),
            showQR == false
                ? SizedBox(
                    height: 10,
                  )
                : 
            Center(
              child: Container(
                decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                width: Get.width - 100,
                padding: EdgeInsets.all(16),
                child: QrImageView(
                  data: controller.text,
                  embeddedImageStyle: QrEmbeddedImageStyle(
                    size: Size(Get.width - 200, Get.width - 200),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
