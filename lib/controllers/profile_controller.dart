
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/repositories/customer/customer_repository.dart';
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