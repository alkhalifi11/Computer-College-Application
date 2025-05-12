// ignore_for_file: unused_local_variable, avoid_print, unnecessary_brace_in_string_interps, unused_import, non_constant_identifier_names, prefer_interpolation_to_compose_strings, depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

//String _basicAuth = 'Basic ' + base64Encode(utf8.encode('Univ:univ1000'));
//Map<String, String> myheaders = {'authorization': _basicAuth};

class Curd {
  getRequest(String url) async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error catch ${e}");
    }
  }

  postRequest(String url, Map data) async {
    try {
      var response =
          await http.post(Uri.parse(url), body: data, /*headers: myheaders*/);
      if (response.statusCode == 200) {
        var responsebody = jsonDecode(response.body);
        return responsebody;
      } else {
        print("Error ${response.statusCode}");
      }
    } catch (e) {
      print("Error catch ${e}");
    }
  }

  postRequestwithFile(String url, Map data, File file) async {
    var request = http.MultipartRequest("POST", Uri.parse(url));

    var length = await file.length();
    var stream = http.ByteStream(file.openRead());
    var MultipatrFile = http.MultipartFile("file", stream, length,
        filename: basename(file.path));
    //request.headers.addAll(myheaders);
    request.files.add(MultipatrFile);

    data.forEach((key, value) {
      request.fields[key] = value;
    });

    var myrequest = await request.send();

    var response = await http.Response.fromStream(myrequest);
    if (myrequest.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print("ERROR ${myrequest.statusCode}");
    }
  }
  Future<void> downloadFile(String url, String filePath) async {
  try {
    // إرسال طلب GET إلى الخادم
    final response = await http.get(Uri.parse(url));

    // التحقق من حالة الاستجابة
    if (response.statusCode == 200) {
      // إنشاء ملف جديد في المسار المحدد
      final file = File(filePath);
      // كتابة البيانات إلى الملف
      await file.writeAsBytes(response.bodyBytes);
      print('تم تنزيل الملف بنجاح إلى: $filePath');
    } else {
      print('فشل تنزيل الملف. حالة الاستجابة: ${response.statusCode}');
    }
  } catch (e) {
    print('حدث خطأ: $e');
  }
}

}
