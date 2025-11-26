import 'package:flutter/material.dart';
import 'dart:async';

import 'package:sanskrit_project/intropage.dart';

class Start extends StatefulWidget {
  const Start({super.key});

  @override
  State<Start> createState() => _StartState();
}

class _StartState extends State<Start> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Intropage();
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Start Page"),
        backgroundColor: Colors.orange.shade800,
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: const Color.fromARGB(255, 220, 89, 8), // page background
        child: Center(
          // 👈 image background color (visible under transparency)
          child: Image.asset(
            'assets/image/image2.png',
            fit: BoxFit.contain, // show full image without cropping
          ),
        ),
      ),
    );
  }
}
