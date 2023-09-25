import 'package:flutter/material.dart';
import 'package:shapp/config/config.dart';
import 'package:shapp/screens/_lib.dart';
import 'package:shapp/styles/styles.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: appName,
      theme: AppTheme.lightTheme,
      home: const Splash(),
    );
  }
}
