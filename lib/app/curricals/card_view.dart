// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unused_import, avoid_unnecessary_containers, sort_child_properties_last, prefer_const_literals_to_create_immutables, deprecated_member_use, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:univapp_2/app/constant/linkapi.dart';
import 'package:url_launcher/url_launcher.dart'; // إضافة المكتبة
import 'package:dio/dio.dart'; // استيراد مكتبة dio
import 'package:permission_handler/permission_handler.dart'; // استيراد مكتبة الأذونات
import '../model/cu_model.dart';

class CardCur extends StatelessWidget {
  const CardCur({super.key, required this.ontap, required this.currimodel});

  final void Function() ontap;
  final CurriModel currimodel;

  Future<void> downloadFile(
      String url, String fileName, BuildContext context) async {
    try {
      // طلب إذن الوصول إلى التخزين
      var status = await Permission.storage.request();
      if (status.isGranted) {
        Dio dio = Dio();
        String savePath =
            "/storage/emulated/0/Download/$fileName"; // مسار الحفظ
        await dio.download(url, savePath);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم تنزيل الملف بنجاح: $savePath")),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("تم رفض إذن الوصول إلى التخزين")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("حدث خطأ أثناء التنزيل: $e")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //مساحة الصورة
            Image.asset(
              "images/wa_2.png",
              width: 130,
              height: 80,
              fit: BoxFit.cover,
            ),

            //ROW مساحة العنوان و نص الخبر المعروض داخل
            ListTile(
              title: Text(
                maxLines: 2,
                "${currimodel.title}",
                style: Theme.of(context).textTheme.headlineSmall,
                textAlign: TextAlign.center,
              ),
              subtitle: Text(
                maxLines: 1,
                "(${currimodel.content})",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),
            ListTile(
              title: Text(
                maxLines: 1,
                "استاذ المادة :  ${currimodel.teacher}",
                style: Theme.of(context).textTheme.titleSmall,
                textAlign: TextAlign.center,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(
                  left: 20, right: 20, top: 0, bottom: 20),
              child: MaterialButton(
                onPressed: () async {
                  final url = "$linkimageRoot/${currimodel.file}";
                  final fileName = currimodel.file?.split('/').last ??
                      'default_file_name.pdf';
                  await downloadFile(
                      url, fileName, context); // استدعاء دالة التنزيل
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
                    Text("تحميل الملف",
                        style: Theme.of(context).textTheme.displayLarge)
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
