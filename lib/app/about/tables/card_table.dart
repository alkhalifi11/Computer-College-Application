// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, deprecated_member_use, unused_import, non_constant_identifier_names, camel_case_types

import 'package:flutter/material.dart';
import '../../constant/linkapi.dart';
import '../../model/college_model.dart';
import '../../model/tables_model.dart';

class Card_Tab extends StatelessWidget {
  const Card_Tab({super.key, required this.ontap, required this.tab_model});

  final void Function() ontap;
  final Tables_Model tab_model;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            //مساحة الصورة
            Expanded(
              // ROW كود يجعل الصورة تاخذ ثلث في المساحة المقدرة داخل
              flex: 1,
              child: Image.network(
                "$linkimageRoot/${tab_model.image}",
                width: 90,
                height: 130,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(width: 10),
            //ROW مساحة العنوان و نص الخبر المعروض داخل
            Expanded(
                flex: 2,
                child: ListTile(
                  title: Text(
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      "${tab_model.title}",
                      style: Theme.of(context).textTheme.headlineSmall),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        "  ${tab_model.date}",
                        style: Theme.of(context).textTheme.titleSmall),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
