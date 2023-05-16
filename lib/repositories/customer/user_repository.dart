import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' hide Response;
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/models/models.dart';

import '../../app_state/app_state.dart';

// class CustomerRepository {
// static CustomerRepository get instance => Get.find();
// final _firestore = FirebaseFirestore.instance;

//   Future<Customer> getDataDetail(String email) async {
//     /// sử dụng email để lấy data, khai báo String email trên funtion
//     final snapShot = await _firestore.collection('User').where('email', isEqualTo: email).get();
//     final data = snapShot.docs
//         .map((e) => Customer.fromSnapShot(e))
//         .single;
//     return data;
//   }
// }

class UserResponsitory {
  Future<Response?> fetchUserPro5() async {
    var dio = Dio();
    var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
    try {
      // dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await dio.get(urlapiUserPro5,
          options: Options(headers: {
            "Authorization": 'Bearer $token',
            // 'content-Type': 'application/json'
          })
      );
      return response;
    } catch (e) {
      print(e);
    }
  }
}
