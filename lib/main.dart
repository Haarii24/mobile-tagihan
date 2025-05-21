import 'package:flutter/material.dart';
import 'pages/transaksi_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIM Keuangan Mahasiswa',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const TransaksiPage(),
    );
  }
}
