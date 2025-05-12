// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, unused_import, avoid_unnecessary_containers, sort_child_properties_last, deprecated_member_use

import 'package:flutter/material.dart';
import '../constant/linkapi.dart';
import '../model/lib_model.dart';

class CardLib extends StatelessWidget {
  const CardLib({super.key, required this.ontap, required this.libmodel});

  final void Function() ontap;
  final LibModel libmodel;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          elevation: 10,
          shadowColor: Colors.black54,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10.0),
                    child: Image.network(
                      "$linkimageRoot/${libmodel.Image}",
                      width: 50,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 20),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${libmodel.Title}',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black87,
                            ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'تأليف: ${libmodel.tuner}',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.displayLarge?.copyWith(
                              fontSize: 14,
                              color: Colors.grey[700],
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
