// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors, file_names, deprecated_member_use
// تصفحة انشاء حقل تسجيل يتم استدعاءه جاهز وقت الحاجة في اي مكان في التطبيق
import 'package:flutter/material.dart';

class CustTextFormSearch extends StatelessWidget {
  // تعريف متغير الاسم الظاهر في الحقل ليتم استدعاءه في اي حقل في التطبيق
  final String names;
  final IconData? iconn;
  final bool decision;
  // ظيفة الكود التالي هو حفظ البيانات التي يقوم المستخدم بادخالها والتحكم فيها
  final TextEditingController mycontroller;

  final String? Function(String?)? valid;
  const CustTextFormSearch({
    super.key,
    required this.names,
    required this.mycontroller,
    this.valid,
    this.iconn,
    required this.decision,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        //اعطى مسافة بين الحقول بمقدار 20 درجات من الاسفل فقط
        margin: EdgeInsets.only(bottom: 20),
        child: Column(
          children: [
            TextFormField(
              cursorColor: Colors.black,
              validator: valid,
              controller: mycontroller,
              obscureText: decision,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8, horizontal: 15),
                labelText: names,
                labelStyle: Theme.of(context).textTheme.titleSmall,
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.black, width: 1),
                  //جعل الحقل دائري بمقدار 10 درجات
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
