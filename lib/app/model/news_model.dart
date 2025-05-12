// ignore_for_file: unnecessary_new, prefer_collection_literals, unnecessary_this, non_constant_identifier_names, unused_import

import 'dart:ffi';

class NewsModel {
  int? Id;
  String? Title;
  String? Content;
  String? Image;
  String? Date;
  int? Type;
  String? Source;
  String? likes;

  NewsModel(
      {this.Id,
      this.Title,
      this.Content,
      this.Image,
      this.Date,
      this.Type,
      this.Source,
      this.likes});

  NewsModel.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Title = json['title'];
    Content = json['content'];
    Image = json['image'];
    Date = json['date'];
    Type = json['type'];
    Source = json['source'];
    likes = json['likes'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.Id;
    data['title'] = this.Title;
    data['content'] = this.Content;
    data['image'] = this.Image;
    data['date'] = this.Date;
    data['type'] = this.Type;
    data['source'] = this.Source;
    data['likes'] = this.likes;
    return data;
  }
}
