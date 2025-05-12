// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.yellow, // لون الخلفية العام
        body: IntroductionScreen(
          pages: [
            PageViewModel(
              title: "مرحباً بك في مجتمعنا",
              body:
                  "انضم إلى تطبيقنا لتكون جزءاً من مجتمع تعليمي مميز. نحن هنا لتقديم أفضل الأدوات والخدمات التي تسهل حياتك التعليمية.",
              image: Center(
                child: Image.asset('images/1.png', height: 600.0),
              ),
              decoration: getPageDecoration(
                titleColor: Colors.black,
                bodyColor: Colors.black87,
                pageColor: Colors.white,
              ),
            ),
            PageViewModel(
              title: "سهولة الاستخدام",
              body:
                  "تم تصميم التطبيق بواجهة مستخدم بسيطة وسهلة الاستخدام، مما يتيح لك الوصول إلى جميع الميزات بسهولة وسرعة.",
              image: Center(
                child: Image.asset('images/easy_use.png', height: 600.0),
              ),
              decoration: getPageDecoration(
                titleColor: Colors.black,
                bodyColor: Colors.black87,
                pageColor: Colors.white,
              ),
            ),
            PageViewModel(
              title: "استمتع بالميزات",
              body:
                  "اكتشف مجموعة واسعة من الميزات التي تساعدك على تنظيم وقتك، متابعة دراستك، وتحقيق أهدافك التعليمية بسهولة.",
              image: Center(
                child: Image.asset('images/library.png', height: 600.0),
              ),
              decoration: getPageDecoration(
                titleColor: Colors.black,
                bodyColor: Colors.black87,
                pageColor: Colors.white,
              ),
            ),
            PageViewModel(
              title: "ابدأ الآن",
              body:
                  "لا تنتظر أكثر! ابدأ رحلتك التعليمية معنا الآن واستمتع بتجربة فريدة ومميزة.",
              image: Center(
                child: Image.asset('images/4.png', height: 600.0),
              ),
              decoration: getPageDecoration(
                titleColor: Colors.black,
                bodyColor: Colors.black87,
                pageColor: Colors.white,
              ),
            ),
          ],
          onDone: () => goToHome(context),
          onSkip: () => goToHome(context), // يمكنك تخطي الشاشات
          showSkipButton: true,
          skip: const Text(
            "تخطي",
            style: TextStyle(
                fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
          next: const Icon(Icons.arrow_forward, size: 24, color: Colors.black),
          done: const Text(
            "ابدأ",
            style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 18, color: Colors.black),
          ),
          dotsDecorator: getDotDecoration(),
          animationDuration: 500, // تحسين الانتقال بين الشاشات
        ),
      ),
    );
  }

  void goToHome(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isFirstTime', false); // تحديث الحالة
    Navigator.of(context)
        .pushReplacementNamed('news'); // الانتقال إلى الشاشة الرئيسية
  }

  DotsDecorator getDotDecoration() => DotsDecorator(
        color: Colors.black26,
        activeColor: Colors.black,
        size: const Size(10, 10),
        activeSize: const Size(22, 10),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      );

  PageDecoration getPageDecoration({
    required Color titleColor,
    required Color bodyColor,
    required Color pageColor,
  }) =>
      PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 26,
          fontWeight: FontWeight.bold,
          color: titleColor,
          fontFamily: 'ElMessiri',
        ),
        bodyTextStyle: TextStyle(
          fontSize: 18,
          color: bodyColor,
          fontFamily: 'ElMessiri',
        ),
        contentMargin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        imagePadding: EdgeInsets.all(24),
        pageColor: pageColor,
      );
}
