import 'package:flutter/material.dart';
import 'package:sanskrit_project/dhatuRupaPage.dart';
import 'package:sanskrit_project/sabdarup/shabdaRupaPage.dart';

class Intropage extends StatefulWidget {
  const Intropage({super.key});

  @override
  State<Intropage> createState() => _IntropageState();
}

class _IntropageState extends State<Intropage> {
  // Navigation function
  void _navigateToShabdaRupa(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Shabdarupapage()),
    );
  }

  void _navigateToDhatuRupa(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Dhaturupapage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("प्रारम्भ पृष्ठ"),
        backgroundColor: Colors.orange.shade800,
        elevation: 0,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image/image2.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Fog Effect Overlay
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.3),
                  Colors.white.withOpacity(0.3),
                ],
                stops: const [0.0, 0.3, 0.7, 1.0],
              ),
            ),
          ),

          // Additional Fog Layers for more realistic effect
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [Colors.white.withOpacity(0.4), Colors.transparent],
              ),
            ),
          ),

          // Content positioned near bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: const EdgeInsets.only(bottom: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // First Card - Connected to शब्दरूप
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () => _navigateToShabdaRupa(context),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: 120,
                        height: 100,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "शब्दरूप",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "शब्दानां रूपाणि",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  // Second Card - Connected to धातुरूप
                  Card(
                    margin: const EdgeInsets.symmetric(horizontal: 10),
                    elevation: 6,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: InkWell(
                      onTap: () => _navigateToDhatuRupa(context),
                      borderRadius: BorderRadius.circular(12),
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        width: 120,
                        height: 100,
                        child: const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "धातुरूप",
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(height: 4),
                            Text(
                              "धातूनां रूपाणि",
                              style: TextStyle(
                                fontSize: 10,
                                color: Colors.black54,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
