// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:univapp_2/app/about/college/card_college.dart';
import 'package:univapp_2/app/about/college/college_page.dart';
import '../../News/card_news.dart';
import '../../News/news_page.dart';
import '../../components/curd.dart';
import '../../components/drawer.dart';
import '../../constant/linkapi.dart';
import '../../model/college_model.dart';
import '../../model/news_model.dart';

class College extends StatefulWidget {
  const College({super.key});

  @override
  State<College> createState() => _HomeState();
}

class _HomeState extends State<College> {
  //
  Curd _curd = Curd();
  //
  get_Coll() async {
    var response = await _curd.postRequest(linkCollView, {"type": '1'});
    return response;
  }

  get_Coll2() async {
    var response = await _curd.postRequest(linkCollView, {"type": '2'});
    return response;
  }

  get_Coll3() async {
    var response = await _curd.postRequest(linkCollView, {"type": '3'});
    return response;
  }

  get_Coll4() async {
    var response = await _curd.postRequest(linkCollView, {"type": '4'});
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
            Text("عن الكلية", style: Theme.of(context).textTheme.headlineMedium),
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
                            "عن كلية الحاسوب و تكنلوجيا المعلومات",
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
                          future: get_Coll(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data['status'] == "fail") {
                                return Center(
                                    child: Text(
                                  "لا توجد معلومات حالياً عن هذا القسم",
                                  style: Theme.of(context).textTheme.headlineSmall,
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
                                    child: Card_Coll(
                                      ontap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Coll_Details_Page(
                                                      snapshot.data['data'],
                                                      coll_model: CollegeModel
                                                          .fromJson(snapshot
                                                              .data['data'][i]),
                                                    )));
                                      },
                                      coll_model: CollegeModel.fromJson(
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
                                style: Theme.of(context).textTheme.headlineSmall,
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
                            "الاقسام الاكاديمية",
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
                          future: get_Coll2(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data['status'] == "fail") {
                                return Center(
                                    child: Text(
                                  "لا توجد معلومات حالياً عن هذا القسم",
                                  style: Theme.of(context).textTheme.headlineSmall,
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
                                    child: Card_Coll(
                                      ontap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Coll_Details_Page(
                                                      snapshot.data['data'],
                                                      coll_model: CollegeModel
                                                          .fromJson(snapshot
                                                              .data['data'][i]),
                                                    )));
                                      },
                                      coll_model: CollegeModel.fromJson(
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
                                style: Theme.of(context).textTheme.headlineSmall,
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
                            "عن شؤون الطلاب",
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
                          future: get_Coll3(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data['status'] == "fail") {
                                return Center(
                                    child: Text(
                                  "لا توجد معلومات حالياً عن هذا القسم",
                                  style: Theme.of(context).textTheme.headlineSmall,
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
                                    child: Card_Coll(
                                      ontap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Coll_Details_Page(
                                                      snapshot.data['data'],
                                                      coll_model: CollegeModel
                                                          .fromJson(snapshot
                                                              .data['data'][i]),
                                                    )));
                                      },
                                      coll_model: CollegeModel.fromJson(
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
                                style: Theme.of(context).textTheme.headlineSmall,
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
                            "عن الشؤون الاكاديمية",
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
                        height: 15,
                      ),
                      FutureBuilder(
                          future: get_Coll4(),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              if (snapshot.data['status'] == "fail") {
                                return Center(
                                    child: Text(
                                  "لا توجد معلومات حالياً عن هذا القسم",
                                  style: Theme.of(context).textTheme.headlineSmall,
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
                                    child: Card_Coll(
                                      ontap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Coll_Details_Page(
                                                      snapshot.data['data'],
                                                      coll_model: CollegeModel
                                                          .fromJson(snapshot
                                                              .data['data'][i]),
                                                    )));
                                      },
                                      coll_model: CollegeModel.fromJson(
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
                                style: Theme.of(context).textTheme.headlineSmall,
                              ));
                            }
                            return Center(
                                child: Text(
                              "جاري تحميل المعلومات...",
                              style: Theme.of(context).textTheme.headlineSmall,
                            ));
                          }),
                      SizedBox(
                        height: 30,
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
