import 'package:cloud_firestore/cloud_firestore.dart';
import '../../constants/add_all.dart';

class Customer {
  String? id;
  String? name;
  String? email;
  String? imageUrl;
  int? phone;

  Customer({ this.name,  this.email, this.imageUrl, this.phone, this.id});
  @override
  List<Object?> get props {
    return [name, imageUrl, email, phone];
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'imageUrl': imageUrl,
      'phone': phone,
    };
  }

  factory Customer.fromSnapShot(DocumentSnapshot<Map<String, dynamic>> doc) {
    return Customer(
        name: doc['name'],
        email: doc['email'],
        imageUrl: doc['imageUrl'],
        phone: doc['phone']);
  }

  static Customer user = Customer(name: "Cale", email: 'cale@gmail.com', imageUrl: 'https://ih1.redbubble.net/image.3768547477.5260/mwo,x1000,ipad_2_snap-pad,750x1000,f8f8f8.jpg', phone: 123456);
}

class User {
  String? id;
  String? name;
  String? email;
  String? password;
  String? role;
  int? maintenance;
  int? closeSystem;
  String? createdAt;
  String? updatedAt;
  String? avatar;
  String? phoneNumber;
  String? address;
  String? userId;

  User(
      {this.id,
        this.name,
        this.email,
        this.password,
        this.role,
        this.maintenance,
        this.closeSystem,
        this.createdAt,
        this.updatedAt,
        this.avatar,
        this.phoneNumber,
        this.address,
        this.userId});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    maintenance = json['maintenance'];
    closeSystem = json['close_system'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    avatar = json['avatar'];
    phoneNumber = json['phoneNumber'];
    address = json['address'];
    userId = json['userId'];
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
    data['avatar'] = this.avatar;
    data['phoneNumber'] = this.phoneNumber;
    data['address'] = this.address;
    data['userId'] = this.userId;
    return data;
  }
}





