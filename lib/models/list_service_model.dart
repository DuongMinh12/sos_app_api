class ListServiceModel {
  String? id;
  String? name;
  String? avatar;
  String? linkOn;
  String? linkOff;
  int? state;
  String? userId;
  String? type;
  String? createdAt;
  String? updatedAt;

  ListServiceModel(
      {this.id,
        this.name,
        this.avatar,
        this.linkOn,
        this.linkOff,
        this.state,
        this.userId,
        this.type,
        this.createdAt,
        this.updatedAt});

  ListServiceModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    avatar = json['avatar'];
    linkOn = json['link_on'];
    linkOff = json['link_off'];
    state = json['state'];
    userId = json['userId'];
    type = json['type'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['link_on'] = this.linkOn;
    data['link_off'] = this.linkOff;
    data['state'] = this.state;
    data['userId'] = this.userId;
    data['type'] = this.type;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
