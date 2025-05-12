// ignore_for_file: prefer_const_constructors, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, unused_import, prefer_final_fields, deprecated_member_use

import 'package:flutter/material.dart';
import 'card_news.dart';
import 'news_page.dart';
import '../components/curd.dart';
import '../components/drawer.dart';
import '../constant/linkapi.dart';
import '../model/news_model.dart';

class News extends StatefulWidget {
  const News({super.key});

  @override
  State<News> createState() => _HomeState();
}

class _HomeState extends State<News> {
  //
  Curd _curd = Curd();
  //
  Future getNews(String newsType) async {
    var response = await _curd.postRequest(linkView, {"type": newsType});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
              Text("الاخبار", style: Theme.of(context).textTheme.headlineMedium),
            ],
          ),
          toolbarHeight: 120,
          bottom: TabBar(
              dividerColor: Color.fromARGB(255, 9, 55, 94),
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white,
              labelStyle: Theme.of(context).textTheme.titleSmall,
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(Icons.language),
                  text: "اخبار عامة",
                ),
                Tab(
                  icon: Icon(Icons.computer),
                  text: "اخبار الكلية",
                ),
                Tab(
                  icon: Icon(Icons.school),
                  text: "اخبار الجامعة",
                )
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
                        buildNewsTabWithRefresh("2"),
                        buildNewsTabWithRefresh("0"),
                        buildNewsTabWithRefresh("1"),
                      ],
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildNewsTab(String newsType) {
    return Container(
      padding: EdgeInsets.all(5),
      child: FutureBuilder(
        future: getNews(newsType),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data['status'] == "fail") {
              return Center(
                child: Text(
                  " لا توجد اخبار حالياً في هذا القسم  ",
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              );
            }
            return SingleChildScrollView(
              child: ListView.builder(
                itemCount: snapshot.data['data'].length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (BuildContext context, int i) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 2, bottom: 0),
                    child: CardNews(
                      ontap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => News_Details_Page(
                              newsmodel:
                                  NewsModel.fromJson(snapshot.data['data'][i]),
                            ),
                          ),
                        );
                      },
                      newsmodel: NewsModel.fromJson(snapshot.data['data'][i]),
                    ),
                  );
                },
              ),
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Text(
                "جاري تحميل الاخبار...",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          }
          return Center(
            child: Text(
              "جاري تحميل الاخبار...",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          );
        },
      ),
    );
  }

  Widget buildNewsTabWithRefresh(String newsType) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {}); // إعادة بناء الواجهة لتحديث البيانات
      },
      child: buildNewsTab(newsType),
    );
  }
}
