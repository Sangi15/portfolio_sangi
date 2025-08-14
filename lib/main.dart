import 'package:flutter/material.dart';
import 'home.dart'; // ✅ No folders, just direct import

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.grey, // fallback color
      ),
      home: Home(), // ✅ from home.dart
    );
  }
}
