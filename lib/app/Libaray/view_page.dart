// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_brace_in_string_interpolations, prefer_final_fields, unused_field, must_be_immutable, unused_import, unnecessary_string_interpolations, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, deprecated_member_use

import 'package:flutter/material.dart';
import '../components/curd.dart';
import '../constant/linkapi.dart';
import '../model/lib_model.dart';
import 'package:dio/dio.dart'; // استيراد مكتبة dio

class Lib_Details_Page extends StatelessWidget {
  Lib_Details_Page(param0, {super.key, required this.libmodel});
  Curd _curd = Curd();

  final LibModel libmodel;

  Future<void> downloadBook(String url, String fileName) async {
    try {
      Dio dio = Dio();
      String savePath = "/storage/emulated/0/Download/$fileName"; // مسار الحفظ
      await dio.download(url, savePath);
      print("تم تنزيل الكتاب بنجاح: $savePath");
    } catch (e) {
      print("حدث خطأ أثناء التنزيل: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 55, 94),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 55, 94),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "محتوئ الكتاب",
          style: Theme.of(context)
              .textTheme
              .headlineMedium
              ?.copyWith(color: Colors.white),
        ),
        centerTitle: true,
        toolbarHeight: 120,
        actions: [
          IconButton(
            icon: Icon(Icons.share, color: Colors.white),
            onPressed: () {
              // Add share functionality here
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 0),
            child: Image.network(
              "$linkimageRoot/${libmodel.Image}",
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
                          "${libmodel.Title}",
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
                                "المولف: ${libmodel.tuner}",
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
                                "تاريخ النشر: ${libmodel.Date}",
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
                        "${libmodel.Content}",
                        style:
                            Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  height: 1.5,
                                  color: Colors.black87,
                                ),
                      ),
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 0, bottom: 20),
                      child: MaterialButton(
                        onPressed: () {
                          String fileUrl = "$linkimageRoot/${libmodel.file}";
                          String fileName = libmodel.file?.split('/').last ?? 'default_file_name';
                          downloadBook(
                              fileUrl, fileName); // استدعاء دالة التنزيل
                        },
                        color: Colors.red[900],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.picture_as_pdf,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("تحميل الكتاب",
                                style: Theme.of(context).textTheme.displayLarge)
                          ],
                        ),
                      ),
                    )
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
