// class loginApi {
//   int? statusCode;
//   Data? data;
//   String? message;
//
//   loginApi({this.statusCode, this.data, this.message});
//
//   loginApi.fromJson(Map<String, dynamic> json) {
//     statusCode = json['statusCode'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     message = json['message'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['statusCode'] = this.statusCode;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['message'] = this.message;
//     return data;
//   }
// }

class LoginApiModel {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  int? maintenance;
  int? closeSystem;
  String? createdAt;
  String? updatedAt;
  String? otpCode;
  String? accessToken;

  LoginApiModel(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.role,
        this.maintenance,
        this.closeSystem,
        this.createdAt,
        this.updatedAt,
        this.otpCode,
        this.accessToken});

  LoginApiModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    maintenance = json['maintenance'];
    closeSystem = json['close_system'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    otpCode = json['otpCode'];
    accessToken = json['accessToken'];
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
    data['otpCode'] = this.otpCode;
    data['accessToken'] = this.accessToken;
    return data;
  }
}
