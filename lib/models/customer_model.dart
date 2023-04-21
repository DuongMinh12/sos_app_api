import 'package:cloud_firestore/cloud_firestore.dart';
import '../constants/add_all.dart';

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

  // static Customer fromSnapshot(DocumentSnapshot snap) {
  //   var user = Customer(
  //     id: snap.id,
  //     name: snap['name'],
  //     email: snap['email'],
  //     imageUrl: snap['imageUrl'],
  //     phone: snap['phone'],
  //   );
  //   return user;
  // }

  // Map<String, dynamic> toMap() {
  //   return {
  //     'name': name,
  //     'email': email,
  //     'phone': phone,
  //     'imageUrl': imageUrl,
  //   };
  // }

  // getdataFromDatabase() async {
  //   final _firestore = await FirebaseAuth.instance.currentUser;
  //   if(_firestore != null){
  //     await FirebaseFirestore.instance.collection('User').doc(_firestore.uid).get().then((value) {
  //       name : value['name'];
  //       email : value['email'];
  //       imageUrl : value['imageUrl'];
  //       phone : value['phone'];
  //       id: value.id;
  //     }).onError((error, stackTrace) {
  //       Utils.toassMessage(error.toString());
  //     });
  //   }
  // }

  static Customer user = Customer(name: "Cale", email: 'cale@gmail.com', imageUrl: 'https://cdn.myanimelist.net/images/characters/2/477265.jpg', phone: 123456);
}


class User {
  String? name = 'Unknow';
  int? phone = 0;
  String? email = 'Unknow';
  // String? password;
  String? avatar = catNetword;

  User({this.name, this.email, this.phone, this.avatar});

  User.fromJson(Map<String, dynamic> json) {
    name = json['username'];
    phone = json['phone'];
    email = json['email'];
    // password = json['password'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    // data['password'] = this.password;
    data['avatar'] = this.avatar;
    return data;
  }
}



