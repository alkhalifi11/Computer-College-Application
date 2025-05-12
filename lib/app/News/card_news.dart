// ignore_for_file: prefer_const_constructors, unnecessary_string_interpolations, deprecated_member_use

import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';
import '../constant/linkapi.dart';
import '../model/news_model.dart';

class CardNews extends StatefulWidget {
  final NewsModel newsmodel;
  final VoidCallback ontap;

  const CardNews({required this.newsmodel, required this.ontap, super.key});

  @override
  _CardNewsState createState() => _CardNewsState();
}

class _CardNewsState extends State<CardNews> {
  bool isLiked = false;
  int likeCount = 0;

  @override
  //دوال زر العجاب وجعله يقوم بحساب عدد الاعجابات
  void initState() {
    super.initState();
    _loadLikeData();
  }

  void _loadLikeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      isLiked = prefs.getBool('isLiked_${widget.newsmodel.Id}') ?? false;
      likeCount = prefs.getInt('likeCount_${widget.newsmodel.Id}') ?? 0;
    });
  }

  void _saveLikeData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLiked_${widget.newsmodel.Id}', isLiked);
    prefs.setInt('likeCount_${widget.newsmodel.Id}', likeCount);
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
      likeCount += isLiked ? 1 : -1;
      _saveLikeData();
    });
  }

//دوال زر المشاركة وجعله يقوم بمشاركة الخبر
  void shareNews() {
    final String newsTitle = widget.newsmodel.Title ?? 'No Title';
    final String newsContent = widget.newsmodel.Content ?? 'No Content';
    final String newsUrl = "$linkimageRoot/${widget.newsmodel.Image}";
    Share.share('Check out this news: $newsTitle\n\n$newsContent\n\n$newsUrl');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.ontap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
              child: Image.network(
                "$linkimageRoot/${widget.newsmodel.Image}",
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.newsmodel.Title ?? 'No Title',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    widget.newsmodel.Content ?? 'No Content',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontSize: 14,
                          color: Colors.grey[700],
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(
                          isLiked
                              ? Icons.thumb_up
                              : Icons.thumb_up_off_alt, // تغيير الأيقونة
                          color: isLiked
                              ? Colors.blue
                              : Colors.grey, // تغيير اللون عند الإعجاب
                          size: isLiked ? 30 : 24, // تكبير الأيقونة عند الإعجاب
                        ),
                        onPressed: toggleLike,
                      ),
                      Text('$likeCount'),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.share,
                            color: Theme.of(context).primaryColor),
                        onPressed: shareNews,
                      ),
                      Icon(Icons.arrow_forward,
                          color: Theme.of(context).primaryColor),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
