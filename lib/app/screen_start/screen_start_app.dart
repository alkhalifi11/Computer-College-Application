// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'dart:async';
import '../News/view.dart'; // استيراد الشاشة الرئيسية

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _opacity = 0.0; // مستوى الشفافية للصورة

  @override
  void initState() {
    super.initState();

    // بدء الأنيميشن بعد قليل
    Timer(Duration(milliseconds: 1), () {
      setState(() {
        _opacity = 1.0; // تغيير الشفافية إلى 1 (ظهور الصورة)
      });
    });

    // الانتقال إلى الشاشة الرئيسية بعد 3 ثوانٍ
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => News()), // الشاشة الرئيسية
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
              opacity: _opacity, // مستوى الشفافية
              duration: Duration(seconds: 2), // مدة الأنيميشن
              child: Image.asset(
                'images/univ_3.jpg', // ضع مسار الشعار هنا
                width: 450,
                height: 450,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
