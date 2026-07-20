import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zestora_foodapp/view/loginscreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );

    scaleAnimation = Tween<double>(
      begin: 0.6,
      end: 1.0,
    ).animate(CurvedAnimation(parent: controller, curve: Curves.easeOutBack));

    fadeAnimation = Tween<double>(begin: 0, end: 1).animate(controller);

    controller.forward();

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget buildCircle(double size, double top, double left) {
    return Positioned(
      top: top,
      left: left,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: Colors.white.withValues(alpha: 0.08),
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffFFB347),
                  Color(0xffFF8C00),
                  Color(0xffFF6B00),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          /// Background Circles
          buildCircle(220, -60, -70),
          buildCircle(120, 650, 250),
          buildCircle(70, 130, 310),
          buildCircle(40, 520, 40),

          /// Main Content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeTransition(
                  opacity: fadeAnimation,
                  child: ScaleTransition(
                    scale: scaleAnimation,
                    child: Container(
                      height: 170,
                      width: 170,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 20,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(25),
                        child: Image.asset("assets/images/logo.png"),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 30),

                FadeTransition(
                  opacity: fadeAnimation,
                  child: Text(
                    "Zestora",
                    style: GoogleFonts.poppins(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

                Text(
                  "Fresh Food, Fast Delivery",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    color: Colors.white70,
                  ),
                ),

                const SizedBox(height: 50),

                const CircularProgressIndicator(color: Colors.white),

                const SizedBox(height: 15),

                Text(
                  "Loading...",
                  style: GoogleFonts.poppins(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
