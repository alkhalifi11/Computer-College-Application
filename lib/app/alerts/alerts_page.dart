// ignore_for_file: prefer_final_fields, prefer_const_constructors, use_build_context_synchronously, sort_child_properties_last, unused_local_variable, unused_import, avoid_print

import 'package:flutter/material.dart';
import 'package:univapp_2/app/alerts/card_alertn.dart';
import 'package:univapp_2/app/components/curd.dart';
import 'package:univapp_2/app/components/drawer.dart';
import 'package:univapp_2/app/constant/linkapi.dart';
import 'package:univapp_2/app/model/alerts_model.dart';

class Alerts extends StatefulWidget {
  const Alerts({super.key});

  @override
  State<Alerts> createState() => _AlertsState();
}

class _AlertsState extends State<Alerts> {
  bool isLoding = false;

  Curd _curd = Curd();

  get_Alwrts() async {
    var response = await _curd.postRequest(linkAlView, {"id": 'id'});
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            Text(
              "التنبيهات",
              style: Theme.of(context).textTheme.headlineMedium ??
                  TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
            ),
          ],
        ),
        toolbarHeight: 120,
      ),
      endDrawer: drawerapp(),
      body: isLoding == true
          ? Center(child: CircularProgressIndicator())
          : Container(
              padding: EdgeInsets.all(5),
              child: ListView(
                children: [
                  FutureBuilder(
                      future: get_Alwrts(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data['status'] == "fail") {
                            return Center(
                                child: Text(
                              "لا توجد تنبيهات حالياً",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ));
                          }
                          return ListView.builder(
                            itemCount: snapshot.data['data'].length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, i) {
                              return Card_alerts(
                                ontap: () {},
                                alerts_model: Alerts_Model.fromJson(
                                    snapshot.data['data'][i]),
                              );
                            },
                          );
                        }
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                              child: Text(
                            "يتم تحميل التنبيهات...",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(),
                          ));
                        }
                        return Center(
                            child: Text(
                          "حدث خطأ ما... يرجى اعادة المحاولة",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(),
                        ));
                      }),
                ],
              ),
            ),
    );
  }
}
