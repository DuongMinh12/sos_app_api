import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:warning_app/models/models.dart';

import '../../constants/utils.dart';

class CustomerRepository extends GetxController {
  static CustomerRepository get instance => Get.find();
  final _firestore = FirebaseFirestore.instance;

  // createUser (Customer user) async{
  //   await _firestore.collection('User').add(user.toMap()).whenComplete(() {
  //     Utils.toassMessage('Your account create successfully');
  //   }).onError((error, stackTrace) {
  //     return Utils.toassMessage(error.toString());
  //   });


  Future<Customer> getDataDetail(String email) async {
    /// sử dụng email để lấy data, khai báo String email trên funtion
    final snapShot = await _firestore.collection('User').where('email', isEqualTo: email).get();
    final data = snapShot.docs
        .map((e) => Customer.fromSnapShot(e))
        .single;
    return data;
  }
}
  // Future<Customer> getdataFromDatabase() async {
  //   ///kết nối với User firestore, lần theo từng uid để lấy data, tự chế :)))
  //   final snapShot = await _firestore.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) => Customer.fromSnapshot(value));
  //   return snapShot;
  // }

  // Future<List<Customer>> getAllData() async {
  //  /// sử dụng email để lấy data, khai báo String email trên funtion
  //  final snapShot = await _firestore.collection('User').where('email', isEqualTo: email).get();
  //  final dataList = snapShot.docs.map((e) => Customer.fromSnapshot(e)).toList();
  //  return dataList;
  // }
  
  
//}
