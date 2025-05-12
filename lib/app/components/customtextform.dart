// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors
// تصفحة انشاء حقل تسجيل يتم استدعاءه جاهز وقت الحاجة في اي مكان في التطبيق
import 'package:flutter/material.dart';

class CustTextForm extends StatelessWidget {
  // تعريف متغير الاسم الظاهر في الحقل ليتم استدعاءه في اي حقل في التطبيق
  final String names;
  final bool decision;
  // ظيفة الكود التالي هو حفظ البيانات التي يقوم المستخدم بادخالها والتحكم فيها
  final TextEditingController mycontroller;

  final String? Function(String?)? valid;
  const CustTextForm({
    super.key,
    required this.names,
    required this.mycontroller,
    this.valid,
    required this.decision,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //اعطى مسافة بين الحقول بمقدار 20 درجات من الاسفل فقط
      margin: EdgeInsets.only(bottom: 20),
      child: TextFormField(
        validator: valid,
        controller: mycontroller,
        obscureText: decision,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
          labelText: names,
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 1),
            //جعل الحقل دائري بمقدار 10 درجات
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
