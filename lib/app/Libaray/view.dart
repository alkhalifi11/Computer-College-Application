// ignore_for_file: prefer_final_fields, prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import, unnecessary_import, deprecated_member_use, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'card_libr.dart';
import 'view_page.dart';
import '../components/curd.dart';
import '../components/customtextform.dart';
import '../components/customtextformSearsh .dart';
import '../components/drawer.dart';
import '../constant/linkapi.dart';
import '../model/lib_model.dart';
import 'package:google_fonts/google_fonts.dart';

class Libaray extends StatefulWidget {
  const Libaray({super.key});

  @override
  State<Libaray> createState() => _HomeState();
}

class _HomeState extends State<Libaray> {
  //
  Curd _curd = Curd();
  //
  Future<dynamic> getBooks() async {
    var response = await _curd.postRequest(linkLibView2, {"type": '1'});
    return response;
  }

  Future<dynamic> getBooks2() async {
    var response = await _curd.postRequest(linkLibView2, {"type": '2'});
    return response;
  }

  Future<dynamic> getBooks3() async {
    var response = await _curd.postRequest(linkLibView2, {"type": '3'});
    return response;
  }

  Future<dynamic> getBooks4() async {
    var response = await _curd.postRequest(linkLibView2, {"type": '4'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
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
              Text("المكتبة العامة",
                  style: GoogleFonts.cairo(
                    textStyle: Theme.of(context).textTheme.headlineMedium,
                    color: Colors.white,
                  )),
            ],
          ),
          toolbarHeight: 120,
          bottom: TabBar(
              dividerColor: Color.fromARGB(255, 9, 55, 94),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: GoogleFonts.cairo(
                textStyle: Theme.of(context).textTheme.titleSmall,
              ),
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.computer),
                  text: "تكنلوجيا",
                ),
                Tab(
                  icon: Icon(Icons.science),
                  text: "علوم",
                ),
                Tab(
                  icon: Icon(Icons.book_sharp),
                  text: "دين",
                ),
                Tab(
                  icon: Icon(Icons.menu),
                  text: "اخرى",
                ),
              ]),
        ),
        endDrawer: drawerapp(),
        body: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0, right: 0, top: 0, bottom: 10),
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30))),
                    child: TabBarView(
                      children: [
                        buildTabContent(getBooks),
                        buildTabContent(getBooks2),
                        buildTabContent(getBooks3),
                        buildTabContent(getBooks4),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildTabContent(Future Function() getBooksFunction) {
    return Container(
      padding: EdgeInsets.all(5),
      child: FutureBuilder(
          future: getBooksFunction(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data['status'] == "fail") {
                return Center(
                    child: Text(
                  "لا توجد كتب في هذا القسم حالياً",
                  style: Theme.of(context).textTheme.titleLarge,
                ));
              }
              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data['data'].length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (BuildContext context, i) {
                    return Padding(
                      padding: const EdgeInsets.only(
                          left: 8, right: 8, top: 2, bottom: 0),
                      child: CardLib(
                        ontap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Lib_Details_Page(
                                        snapshot.data['data'],
                                        libmodel: LibModel.fromJson(
                                            snapshot.data['data'][i]),
                                      )));
                        },
                        libmodel: LibModel.fromJson(snapshot.data['data'][i]),
                      ),
                    );
                  },
                ),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            }
            return Center(
                child: Text("حدث خطأ ما يرجى اعادة المحاولة ...نحن نتأسف"));
          }),
    );
  }
}
