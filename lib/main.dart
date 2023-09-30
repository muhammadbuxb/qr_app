import 'package:flutter/material.dart';
import 'package:qr_app/home.dart';
import 'package:qr_app/qrcode.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Scanner',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black54,
        primarySwatch: Colors.green,
      //  appBarTheme: AppBarTheme(
      //   backgroundColor: Colors.transparent,
      //   elevation: 0.0,
      //  )
      ),
      home: HomeScreen(),
    );
  }
}
