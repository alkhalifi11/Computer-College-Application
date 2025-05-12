// ignore_for_file: camel_case_types, prefer_const_constructors, prefer_typing_uninitialized_variables, unused_local_variable, unnecessary_brace_in_string_interpolations, prefer_final_fields, unused_field, must_be_immutable, unused_import, unnecessary_string_interpolations, avoid_unnecessary_containers, deprecated_member_use, unnecessary_import, prefer_const_literals_to_create_immutables, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:univapp_2/app/model/team_model.dart';
import '../components/curd.dart';
import '../constant/linkapi.dart';
import '../model/news_model.dart';

class Team_Details_Page extends StatelessWidget {
  Team_Details_Page(param0, {super.key, required this.team_model});
  Curd _curd = Curd();

  final Team_Model team_model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 9, 55, 94),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 9, 55, 94),
        iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "عرض الكادر",
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
        centerTitle: true,
        toolbarHeight: 120,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 1, right: 1),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0),
                          child: Image.network(
                            "$linkimageRoot/${team_model.image}",
                            height: 250,
                            width: 600,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Center(
                          child: Text(
                            team_model.name ?? 'No Title',
                            style:
                                Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Center(
                          child: Text(
                            team_model.section ?? 'No Title',
                            style:
                                Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                        SizedBox(
                          height: 3,
                        ),
                        Center(
                          child: Text(
                            team_model.content ?? 'No Title',
                            style:
                                Theme.of(context).textTheme.titleLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                    ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 40),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 0, bottom: 20),
                      child: MaterialButton(
                        onPressed: () {},
                        color: Colors.red[900],
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.picture_as_pdf,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text("السيرة الذاتية",
                                style: Theme.of(context).textTheme.displayLarge)
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
