// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, deprecated_member_use, non_constant_identifier_names, use_super_parameters, unused_import

import 'package:flutter/material.dart';
import 'package:univapp_2/app/model/team_model.dart';
import '../constant/linkapi.dart';

class CardTeam extends StatelessWidget {
  final Team_Model team_model;

  const CardTeam({required this.team_model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Card(
          elevation: 5,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.network(
                              "$linkimageRoot/${team_model.image}",
                              height: 70,
                              width: 70,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(width: 15),
                          Center(
                            child: Text(
                              team_model.name ?? 'No Title',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineSmall
                                  ?.copyWith(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.person, color: Colors.green),
                        SizedBox(width: 5),
                        Text(
                          team_model.content ?? 'No Date',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.location_on, color: Colors.redAccent),
                        SizedBox(width: 5),
                        Text(
                          team_model.section ?? 'No Location',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
