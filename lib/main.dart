// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, deprecated_member_use, depend_on_referenced_packages, use_key_in_widget_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:univapp_2/app/Screens_app/screens.dart';
import 'package:univapp_2/app/Settings/settings.dart';
import 'package:univapp_2/app/Team/view.dart';
import 'package:univapp_2/app/about_app/about_app.dart';
import 'package:univapp_2/app/alerts/alerts_page.dart';
import 'app/Libaray/view.dart';
import 'app/News/view.dart';
import 'app/about/college/view.dart';
import 'app/about/tables/view.dart';
import 'app/auth/login.dart';
import 'app/curricals/view.dart';
import 'app/screen_start/screen_start_app.dart';

late SharedPreferences sharedpref;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  sharedpref = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // التحقق مما إذا كان المستخدم قد شاهد شاشات المقدمة
    bool isFirstTime = sharedpref.getBool('isFirstTime') ?? true;

    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'), // Arabic
      ],
      debugShowCheckedModeBanner: false,
      title: "MainApp",
      theme: ThemeData(
        fontFamily: 'ElMessiri',
        textTheme: ThemeData.light().textTheme.copyWith(
              //1
              displayLarge: TextStyle(
                  fontSize: 13,
                  color: Colors.white,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              //2
              headlineMedium: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              //3
              titleSmall: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              //4
              headlineSmall: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
              // 5
              titleLarge: TextStyle(
                  fontSize: 22,
                  color: const Color.fromARGB(255, 41, 32, 32),
                  fontFamily: 'ElMessiri',
                  fontWeight: FontWeight.bold),
            ),
      ),

      initialRoute: isFirstTime ? 'onboarding' : 'splash', // شاشة البداية
      routes: {
        'splash': (context) => SplashScreen(),
        'onboarding': (context) => OnboardingScreen(),
        'login': (context) => Login(),
        'news': (context) => News(),
        'libaray': (context) => Libaray(),
        'currical': (context) => Currical(),
        'college': (context) => College(),
        'tables': (context) => Tables(),
        'team': (context) => Team(),
        'about_app': (context) => About_App(),
        'settings': (context) => SettingsPage(),
        'alerts': (context) => Alerts(),
      },
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("الصفحة الرئيسية")),
      body: Center(child: Text("مرحباً بك في الصفحة الرئيسية!")),
    );
  }
}
