// ignore_for_file: unnecessary_this, unnecessary_new, prefer_collection_literals

class LibModel {
  int? Id;
  String? Title;
  String? Content;
  String? Date;
  String? file;
  String? Image;
  String? tuner;
  int? Type;

  LibModel(
      {this.Id,
      this.Title,
      this.Content,
      this.Date,
      this.file,
      this.Image,
      this.tuner,
      this.Type});

  LibModel.fromJson(Map<String, dynamic> json) {
    Id = json['id'];
    Title = json['title'];
    Content = json['content'];
    Date = json['date'];
    file = json['file'];
    Image = json['image'];
    tuner = json['Tuner'];
    Type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.Id;
    data['title'] = this.Title;
    data['content'] = this.Content;
    data['date'] = this.Date;
    data['file'] = this.file;
    data['image'] = this.Image;
    data['Tuner'] = this.tuner;
    data['type'] = this.Type;
    return data;
  }
}