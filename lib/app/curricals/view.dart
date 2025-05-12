// ignore_for_file: prefer_const_constructors, prefer_final_fields, non_constant_identifier_names, unused_import, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_local_variable, deprecated_member_use, unnecessary_import

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/curd.dart';
import '../components/drawer.dart';
import '../constant/linkapi.dart';
import 'card_view.dart';
import '../model/cu_model.dart';

class Currical extends StatefulWidget {
  const Currical({
    super.key,
  });

  @override
  State<Currical> createState() => _HomeState();
}

class _HomeState extends State<Currical> {
  List<String> typelest = ['--', 'الكل', 'CS', 'IT'];
  String? selectedtype = '--';

  List<String> levellest = ['--', 'الاول', 'الثاني', 'الثالث', 'الرابع'];
  String? selectedlevel = '--';

  List<String> Chapterlest = ['--', 'الاول', 'الثاني'];
  String? selectedChapter = '--';

  String? Items;
  String? Items2;
  String? Items3;

  bool isDense = false;
  //
  Curd _curd = Curd();
  //
  getCur() async {
    if (Items != 'الكل') {
      var response = await _curd.postRequest(linkCuView2, {
        "type": Items,
        "level": Items2,
        "chapter": Items3,
      });
      return response;
    }
    if (Items == 'الكل') {
      var response = await _curd.postRequest(linkCuView, {
        "id": "id",
      });
      return response;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 55, 94),
      appBar: AppBar(
        toolbarHeight: 120,
        backgroundColor: const Color.fromARGB(255, 9, 55, 94),
        iconTheme: IconThemeData(color: Colors.white, size: 30),
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
            Text("مناهج الكلية", style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
      ),
      drawerScrimColor: Colors.black.withOpacity(0.8),
      endDrawer: drawerapp(),
      body: Container(
        padding: EdgeInsets.all(5),
        child: ListView(
          children: [
            Container(
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          Text(
                            "التخصص :",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          DropdownButton<String>(
                            value: selectedtype,
                            items: typelest
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style:
                                          Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedtype = Items = item),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Column(
                        children: [
                          Text(
                            "المستوى :",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          DropdownButton<String>(
                            value: selectedlevel,
                            items: levellest
                                .map(
                                  (item) => DropdownMenuItem(
                                    value: item,
                                    child: Text(
                                      item,
                                      style:
                                          Theme.of(context).textTheme.titleSmall,
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (item) =>
                                setState(() => selectedlevel = Items2 = item),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 35,
                      ),
                      Column(
                        children: [
                          Text(
                            "الفصل :",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          DropdownButton<String>(
                            value: selectedChapter,
                            items: Chapterlest.map(
                              (item) => DropdownMenuItem(
                                value: item,
                                child: Text(
                                  item,
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                              ),
                            ).toList(),
                            onChanged: (item) =>
                                setState(() => selectedChapter = Items3 = item),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 500,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: ListView(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  FutureBuilder(
                      future: getCur(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == "fail") {
                            return Center(
                                child: Text(
                              "لا توجد اي مناهج / مراجع حالياً",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, i) {
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: CardCur(
                                  ontap: () {},
                                  currimodel: CurriModel.fromJson(
                                      snapshot.data['data'][i]),
                                ),
                              );
                            },
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(child: Text("جاري التحميل..."));
                        }

                        return Center(
                            child: Text(
                          "يرجى تحديد التخصص و المستوى المطلوب..!!",
                          style: TextStyle(fontWeight: FontWeight.w900),
                        ));
                      }),
                  SizedBox(
                    height: 30,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
