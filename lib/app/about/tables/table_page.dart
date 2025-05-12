// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_brace_in_string_interps, prefer_final_fields, unused_field, must_be_immutable, unused_import, unnecessary_string_interpolations, avoid_unnecessary_containers, deprecated_member_use, unnecessary_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';
import '../../components/curd.dart';
import '../../constant/linkapi.dart';
import '../../model/college_model.dart';
import '../../model/tables_model.dart';

class Tab_Details_Page extends StatelessWidget {
  Tab_Details_Page(param0, {super.key, required this.tab_model});
  Curd _curd = Curd();

  final Tables_Model tab_model;

  void showImageDialog(BuildContext context, String imageUrl) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: InteractiveViewer(
            child: Image.network(
              imageUrl,
              fit: BoxFit.contain,
            ),
          ),
        );
      },
    );
  }

  Future<void> downloadImage(BuildContext context, String imageUrl) async {
    try {
      // الحصول على مسار التخزين
      final directory = await getApplicationDocumentsDirectory();
      final filePath = '${directory.path}/${tab_model.title}.jpg';

      // تحميل الصورة باستخدام Dio
      Dio dio = Dio();
      await dio.download(imageUrl, filePath);

      // عرض رسالة نجاح
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('تم تحميل الجدول بنجاح: $filePath')),
      );
    } catch (e) {
      // عرض رسالة خطأ
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('حدث خطأ أثناء تحميل الجدول')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 9, 55, 94),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 55, 94),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("عرض الجدول",
              style: Theme.of(context).textTheme.headlineMedium),
          centerTitle: true,
          toolbarHeight: 120,
        ),
        body: Column(
          children: [
            GestureDetector(
              onTap: () {
                showImageDialog(context, "$linkimageRoot/${tab_model.image}");
              },
              child: Padding(
                padding: const EdgeInsets.only(bottom: 0),
                child: Image.network(
                  "$linkimageRoot/${tab_model.image}",
                  height: 310,
                  width: 420,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 1, right: 1),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: ListView(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 20, bottom: 20, right: 0, left: 0),
                        child: Container(
                          padding: EdgeInsets.all(5),
                          color: Colors.grey[200],
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "${tab_model.title}",
                              style: Theme.of(context).textTheme.titleLarge,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsets.only(right: 10, top: 8, bottom: 5),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  " تاريخ النشر :  ${tab_model.date}",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 20, right: 20, top: 0, bottom: 20),
                        child: MaterialButton(
                          onPressed: () {
                            downloadImage(
                                context, "$linkimageRoot/${tab_model.image}");
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
                              Text("تحميل الجدول",
                                  style:
                                      Theme.of(context).textTheme.displayLarge)
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
