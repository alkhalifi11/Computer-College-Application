// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_brace_in_string_interpolations, prefer_final_fields, unused_field, must_be_immutable, unused_import, unnecessary_string_interpolations, avoid_unnecessary_containers, deprecated_member_use, unnecessary_import

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/curd.dart';
import '../constant/linkapi.dart';
import '../model/news_model.dart';

class News_Details_Page extends StatelessWidget {
  News_Details_Page({super.key, required this.newsmodel});
  final Curd _curd = Curd();

  final NewsModel newsmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 55, 94),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 55, 94),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "قراءة الخبر",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Image.network(
              "$linkimageRoot/${newsmodel.Image}",
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          "${newsmodel.Title}",
                          style:
                              Theme.of(context).textTheme.titleLarge?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                    color: Colors.black87,
                                  ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.source, color: Colors.grey[700]),
                              SizedBox(width: 5),
                              Text(
                                "المصدر: ${newsmodel.Source}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[900],
                                    ),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Icon(Icons.date_range, color: Colors.grey[700]),
                              SizedBox(width: 5),
                              Text(
                                "تاريخ النشر: ${newsmodel.Date}",
                                style: Theme.of(context)
                                    .textTheme
                                    .displayLarge
                                    ?.copyWith(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.grey[900],
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "${newsmodel.Content}",
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              height: 1.5,
                              color: Colors.black87,
                            ),
                      ),
                    ),
                    SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
