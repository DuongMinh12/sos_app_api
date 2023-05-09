
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/repositories/customer/user_repository.dart';
import 'package:warning_app/screens/screens.dart';

class ProfileController extends GetxController{
  static ProfileController get instance => Get.find();
  final _userRepo = Get.put(CustomerRepository());


  getUserdata(){
    final email = FirebaseAuth.instance.currentUser?.email;
    if(email !=null){
      return _userRepo.getDataDetail(email);
    }
    else{
      return Utils.toassMessage('Error, have trouble with connected firebase');
    }
  }
}

void userDatawithApi() async{
var dio = Dio();
try{
  var reponse = await dio.get(urlapiUser, data: {

  });

}catch(e){
  print(e.toString());
}
}