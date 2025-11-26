import 'package:flutter/material.dart';
import 'package:sanskrit_project/Admin_Panel/adminDashboard.dart';
import 'package:sanskrit_project/start.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const Start(),
    );
  }
}
