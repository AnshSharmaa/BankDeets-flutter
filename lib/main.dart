import 'package:flutter/material.dart';
import 'package:bank_deets/views/landing_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Toally not a scam',
      home: Register(),
      debugShowCheckedModeBanner: false,
    );
  }
}
