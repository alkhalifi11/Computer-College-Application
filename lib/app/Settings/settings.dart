// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:univapp_2/app/components/drawer.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 55, 94),
        iconTheme: IconThemeData(color: Colors.white, size: 35),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 10,
              height: 40,
              color: Colors.blue,
            ),
            SizedBox(
              width: 7,
            ),
            Text(
              "الاعدادات",
              style: Theme.of(context).textTheme.headlineMedium ??
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        toolbarHeight: 120,
      ),
      endDrawer: drawerapp(),
      body: Column(
        children: [
          ListTile(
            title: Text("اللغة "),
            trailing: DropdownButton<String>(
              value: Localizations.localeOf(context).languageCode,
              items: [
                DropdownMenuItem(
                  value: 'ar',
                  child: Text("العربية"),
                ),
                DropdownMenuItem(
                  value: 'en',
                  child: Text("English"),
                ),
              ],
              onChanged: (String? value) {
                if (value != null) {}
              },
            ),
          ),
        ],
      ),
    );
  }
}
