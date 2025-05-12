class Team_Model {
  int? id;
  String? name;
  String? content;
  String? image;
  String? file;
  String? section;
  String? des;
  int? type;

  Team_Model(
      {this.id,
      this.name,
      this.content,
      this.image,
      this.file,
      this.section,
      this.des,
      this.type});

  Team_Model.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    content = json['content'];
    image = json['image'];
    file = json['file'];
    section = json['section'];
    des = json['des'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['content'] = this.content;
    data['image'] = this.image;
    data['file'] = this.file;
    data['section'] = this.section;
    data['des'] = this.des;
    data['type'] = this.type;
    return data;
  }
}