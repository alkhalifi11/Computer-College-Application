// ignore_for_file: prefer_const_constructors, camel_case_types, deprecated_member_use

import 'dart:async'; // لإضافة Timer
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:badges/badges.dart' as badges; // إضافة مكتبة badges
import '../../main.dart';

class drawerapp extends StatefulWidget {
  const drawerapp({super.key});

  @override
  _drawerappState createState() => _drawerappState();
}

class _drawerappState extends State<drawerapp> {
  bool showNotificationBadge = false; // حالة لإظهار أو إخفاء العلامة
  Timer? _timer; // مؤقت لتحديث التنبيهات

  @override
  void initState() {
    super.initState();
    _checkForNewNotifications(); // التحقق من التنبيهات عند بدء التطبيق
    _startNotificationChecker(); // بدء التحقق بشكل دوري
  }

  @override
  void dispose() {
    _timer?.cancel(); // إلغاء المؤقت عند التخلص من الواجهة
    super.dispose();
  }

  void _startNotificationChecker() {
    _timer = Timer.periodic(Duration(seconds: 10), (timer) {
      _checkForNewNotifications();
    });
  }

  void _checkForNewNotifications() {
    // محاكاة التحقق من وجود تنبيهات جديدة
    // يمكن استبدال هذا الجزء باستدعاء API
    bool hasNewNotifications = DateTime.now().second % 2 == 0; // مثال عشوائي

    setState(() {
      showNotificationBadge = hasNewNotifications; // تحديث حالة العلامة
    });
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Column(
            children: [
              UserAccountsDrawerHeader(
                accountName: null,
                accountEmail: null,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("images/photo.jpg"), fit: BoxFit.cover),
                ),
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.bell,
                title: "التنبيهات",
                routeName: "alerts",
                color: Colors.amber,
                showBadge: showNotificationBadge, // استخدام الحالة هنا
                onTap: () {
                  setState(() {
                    showNotificationBadge = false; // إخفاء العلامة عند الفتح
                  });
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil("alerts", (route) => false);
                },
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.newspaper,
                title: "الاخبار",
                routeName: "news",
                color: Colors.blue,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.book,
                title: "المكتبة العامة",
                routeName: "libaray",
                color: Colors.green,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.bookOpen,
                title: "مناهج الكلية",
                routeName:
                    sharedpref.getString('id') == null ? 'login' : 'currical',
                color: Colors.orange,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.fileAlt,
                title: "النتائج",
                routeName:
                    sharedpref.getString('id') == null ? 'login' : 'results',
                color: Colors.red,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.calendarAlt,
                title: "الجداول",
                routeName:
                    sharedpref.getString('id') == null ? 'login' : 'tables',
                color: Colors.purple,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.laptop,
                title: "التسجيل الالكتروني",
                routeName: sharedpref.getString('id') == null ? 'login' : '',
                color: Colors.teal,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.university,
                title: "عن الكلية",
                routeName: 'college',
                color: Colors.brown,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.users,
                title: "كادر الكلية",
                routeName: "team",
                color: Colors.pink,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.cog,
                title: "الإعدادات",
                routeName: "settings",
                color: Colors.blueGrey,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.infoCircle,
                title: "حول التطبيق",
                routeName: "about_app",
                color: Colors.cyan,
              ),
              _buildListTile(
                context,
                icon: FontAwesomeIcons.signOutAlt,
                title: "تسجيل الخروج",
                routeName: "login",
                color: Colors.grey,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildListTile(BuildContext context,
      {required IconData icon,
      required String title,
      required String routeName,
      required Color color,
      bool showBadge = false,
      VoidCallback? onTap}) {
    return ListTile(
      leading: showBadge
          ? badges.Badge(
              badgeContent: Text(
                '!',
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              position: badges.BadgePosition.topEnd(top: -10, end: -10),
              child: FaIcon(icon, color: color),
            )
          : FaIcon(icon, color: color),
      title: Text(
        title,
        style: Theme.of(context).textTheme.headlineSmall,
        textAlign: TextAlign.center,
      ),
      onTap: onTap ??
          () {
            Navigator.of(context)
                .pushNamedAndRemoveUntil(routeName, (route) => false);
          },
    ).animate().fadeIn(duration: 500.ms).scale();
  }
}
