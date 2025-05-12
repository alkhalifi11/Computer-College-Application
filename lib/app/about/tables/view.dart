// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import '../../News/card_news.dart';
import '../../News/news_page.dart';
import 'card_table.dart';
import 'table_page.dart';
import '../../components/curd.dart';
import '../../components/drawer.dart';
import '../../constant/linkapi.dart';
import '../../model/college_model.dart';
import '../../model/news_model.dart';
import '../../model/tables_model.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _HomeState();
}

class _HomeState extends State<Tables> {
  //
  Curd _curd = Curd();
  //
  get_Tab() async {
    var response = await _curd.postRequest(linkTabView, {"allocated": 'cs'});
    return response;
  }

  get_Tab2() async {
    var response = await _curd.postRequest(linkTabView, {"allocated": 'it'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 55, 94),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 9, 55, 94),
        iconTheme: IconThemeData(color: Colors.white, size: 35),
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
            Text("الجداول", style: Theme.of(context).textTheme.headlineMedium),
          ],
        ),
        toolbarHeight: 120,
      ),
      endDrawer: drawerapp(),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 2),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))),
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: ListView(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                          Text(
                            "جداول محاضرات قسم علوم الحاسوب",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'ElMessiri',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: get_Tab(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data['status'] == "fail") {
                                return Center(
                                    child: Text(
                                  "لا توجد جداول في هذا القسم حالياً",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ));
                              }
                              return ListView.builder(
                                itemCount: snapshot.data['data'].length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 2, bottom: 0),
                                    child: Card_Tab(
                                      ontap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Tab_Details_Page(
                                                      snapshot.data['data'],
                                                      tab_model: Tables_Model
                                                          .fromJson(snapshot
                                                              .data['data'][i]),
                                                    )));
                                      },
                                      tab_model: Tables_Model.fromJson(
                                          snapshot.data['data'][i]),
                                    ),
                                  );
                                },
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: Text(
                                "جاري تحميل المعلومات...",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ));
                            }
                            return Center(
                                child: Text(
                              "جاري تحميل المعلومات...",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ));
                          }),
                      SizedBox(
                        height: 40,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
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
                          Text(
                            "جداول محاضرات قسم تقنية المعلومات",
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w900,
                              fontFamily: 'ElMessiri',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      FutureBuilder(
                          future: get_Tab2(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data['status'] == "fail") {
                                return Center(
                                    child: Text(
                                  " لا توجد جداول في هذا القسم حالياً",
                                  style:
                                      Theme.of(context).textTheme.headlineSmall,
                                ));
                              }
                              return ListView.builder(
                                itemCount: snapshot.data['data'].length,
                                shrinkWrap: true,
                                physics: NeverScrollableScrollPhysics(),
                                itemBuilder: (BuildContext context, i) {
                                  return Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 2, bottom: 0),
                                    child: Card_Tab(
                                      ontap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Tab_Details_Page(
                                                      snapshot.data['data'],
                                                      tab_model: Tables_Model
                                                          .fromJson(snapshot
                                                              .data['data'][i]),
                                                    )));
                                      },
                                      tab_model: Tables_Model.fromJson(
                                          snapshot.data['data'][i]),
                                    ),
                                  );
                                },
                              );
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.waiting) {
                              return Center(
                                  child: Text(
                                "جاري تحميل المعلومات...",
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ));
                            }
                            return Center(
                                child: Text(
                              "جاري تحميل المعلومات...",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ));
                          }),
                      SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
