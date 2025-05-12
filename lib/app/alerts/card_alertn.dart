// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, camel_case_types

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:univapp_2/app/model/alerts_model.dart';

class Card_alerts extends StatefulWidget {
  const Card_alerts(
      {super.key,
      required this.ontap,
      required this.alerts_model,
      this.onDelete});

  final void Function() ontap;
  final Alerts_Model alerts_model;
  final void Function()? onDelete;

  @override
  _Card_alertsState createState() => _Card_alertsState();
}

class _Card_alertsState extends State<Card_alerts> {
  int likes = 0;
  int dislikes = 0;
  bool hasLiked = false;
  bool hasDisliked = false;

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      likes = prefs.getInt('${widget.alerts_model.Id}_likes') ?? 0;
      dislikes = prefs.getInt('${widget.alerts_model.Id}_dislikes') ?? 0;
      hasLiked = prefs.getBool('${widget.alerts_model.Id}_hasLiked') ?? false;
      hasDisliked =
          prefs.getBool('${widget.alerts_model.Id}_hasDisliked') ?? false;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('${widget.alerts_model.Id}_likes', likes);
    await prefs.setInt('${widget.alerts_model.Id}_dislikes', dislikes);
    await prefs.setBool('${widget.alerts_model.Id}_hasLiked', hasLiked);
    await prefs.setBool('${widget.alerts_model.Id}_hasDisliked', hasDisliked);
  }

  void _incrementLikes() {
    if (!hasLiked) {
      setState(() {
        likes++;
        hasLiked = true;
        if (hasDisliked) {
          dislikes--;
          hasDisliked = false;
        }
      });
      _savePreferences();
    }
  }

  void _incrementDislikes() {
    if (!hasDisliked) {
      setState(() {
        dislikes++;
        hasDisliked = true;
        if (hasLiked) {
          likes--;
          hasLiked = false;
        }
      });
      _savePreferences();
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.ontap,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 5,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Image area
              ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Icon(Icons.announcement, size: 50, color: Colors.orange),
              ),
              SizedBox(height: 20),
              // Title area with background
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                decoration: BoxDecoration(
                  color: Colors.orange[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Text(
                  "${widget.alerts_model.Title}",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black87,
                      ),
                ),
              ),
              SizedBox(height: 15),
              // Content area
              Text(
                "${widget.alerts_model.Content}",
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              SizedBox(height: 15),
              // Like and Dislike buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: hasLiked ? null : _incrementLikes,
                    icon: Icon(
                      Icons.thumb_up,
                      color: hasLiked ? Colors.blue : Colors.grey,
                      size: hasLiked ? 30 : 24, // تكبير الأيقونة عند التفاعل
                    ),
                  ),
                  Text(
                    "$likes",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 20),
                  IconButton(
                    onPressed: hasDisliked ? null : _incrementDislikes,
                    icon: Icon(
                      Icons.thumb_down,
                      color: hasDisliked ? Colors.red : Colors.grey,
                      size: hasDisliked ? 30 : 24, // تكبير الأيقونة عند التفاعل
                    ),
                  ),
                  Text(
                    "$dislikes",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              // Delete button
              if (widget.onDelete != null)
                IconButton(
                  onPressed: widget.onDelete,
                  icon: Icon(Icons.delete, color: Colors.redAccent),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
