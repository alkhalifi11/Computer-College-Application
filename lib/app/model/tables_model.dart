class Tables_Model {
  int? id;
  String? title;
  String? image;
  String? allocated;
  int? type;
  int? level;
  String? date;

  Tables_Model(
      {this.id,
      this.title,
      this.image,
      this.allocated,
      this.type,
      this.level,
      this.date});

  Tables_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    allocated = json['allocated'];
    type = json['type'];
    level = json['level'];
    date = json['date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['allocated'] = this.allocated;
    data['type'] = this.type;
    data['level'] = this.level;
    data['date'] = this.date;
    return data;
  }
}