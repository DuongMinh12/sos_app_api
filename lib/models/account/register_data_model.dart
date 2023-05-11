class RegisterDataModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  int? maintenance;
  int? closeSystem;
  String? createdAt;
  String? updatedAt;

  RegisterDataModel(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.role,
        this.maintenance,
        this.closeSystem,
        this.createdAt,
        this.updatedAt});

  RegisterDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    maintenance = json['maintenance'];
    closeSystem = json['close_system'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['email'] = this.email;
    data['password'] = this.password;
    data['role'] = this.role;
    data['maintenance'] = this.maintenance;
    data['close_system'] = this.closeSystem;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
