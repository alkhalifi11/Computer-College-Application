// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_brace_in_string_interps, prefer_final_fields, unused_field, must_be_immutable, unused_import, unnecessary_string_interpolations, avoid_unnecessary_containers, deprecated_member_use, unnecessary_import, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../components/curd.dart';
import '../../constant/linkapi.dart';
import '../../model/college_model.dart';
import '../../model/news_model.dart';

class Coll_Details_Page extends StatelessWidget {
  Coll_Details_Page(param0, {super.key, required this.coll_model});
  Curd _curd = Curd();

  final CollegeModel coll_model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 9, 55, 94),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 9, 55, 94),
          iconTheme: IconThemeData(color: Colors.white),
          title: Text("التفاصيل", style: Theme.of(context).textTheme.headlineMedium),
          centerTitle: true,
          toolbarHeight: 120,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: Image.network(
                "$linkimageRoot/${coll_model.Image}",
                height: 350,
                width: 430,
                fit: BoxFit.cover,
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
                              "${coll_model.Title}",
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
                                  " تاريخ النشر :  ${coll_model.Date}",
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
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Text(
                          "${coll_model.Content}",
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 0, right: 200),
                        child: Text(
                          "${coll_model.Source}",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
