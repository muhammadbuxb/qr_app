import 'package:flutter/material.dart';
import 'package:qr_app/qr_scanner.dart';
import 'package:qr_app/qrcode.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _selectedIndex = 0;
  final List<Widget> _pageList = [
   QRCode(),
   QRScannerPage()
  ];

  onTappedItem(int index) {
    setState(() {
        
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageList.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_2_rounded), label: 'Generate QR'),
          BottomNavigationBarItem(
              icon: Icon(Icons.qr_code_scanner_rounded), label: 'Scan QR'),
          
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.green,
        onTap: onTappedItem,
        unselectedItemColor:Colors.black38,
      ),
    );
  }
}