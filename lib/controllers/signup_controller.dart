import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:warning_app/constants/utils.dart';
import '../constants/add_all.dart';
import '../screens/screens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

  // static SignUpController get instance => Get.find();
  // final email = TextEditingController();
  // final name = TextEditingController();
  // final phone = TextEditingController();
  // final pw = TextEditingController();

  void SignUp(BuildContext context, String username, String email, int phone, String password) {
    FirebaseAuth auth = FirebaseAuth.instance;
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    try {
      auth.createUserWithEmailAndPassword(email: email, password: password).then((value) {
        final _uid = value.user!.uid;
        //SessionController().userID = value.user!.uid.toString();
        firestore.collection('User').doc(_uid).set({
          'email' : email,
          'name' : username,
          'phone' : phone,
          'imageUrl': '',
          'id' : value.user!.uid.toString(),
          'timeCreateAcc' : DateTime.now(),
        }).then((value) {
          Utils.toassMessage('Create account successfully!');
          Future.delayed(Duration(seconds: 2), () => Navigator.pushNamed(context, DrawerMenu.routeName));
        }).onError((error, stackTrace) {
          Utils.toassMessage(error.toString());
          print(error);
        });

        print('Create new account');
        //Utils.toassMessage('User created successfully');
      }).onError((error, stackTrace) {
        print(error);
        Utils.toassMessage(error.toString());
      });
    } catch (e) {
      print(e);
      Utils.toassMessage(e.toString());
    }
    ;
  }

void RegisterWithApi(BuildContext context, String name, String email, String password) async{
  var dio = Dio();
  try{
    var response = await dio.post(urlapiregister, data: {
      'email': email,
      'password': password,
      'name': name,
    });
    if(response.data['statusCode'] ==200){
      Utils.toassMessage(response.data['message']);
      // Future.delayed(Duration(seconds: 2),()=> Navigator.pushNamed(context, DrawerMenu.routeName));
      print(response.data);
      print('regesst succesws');
    }
    else if (response.data['statusCode'] == 409){
      print(response.data['message']);
      Utils.toassMessage(response.data['message']);
    }
    // print(response);
    // Utils.toassMessage(response.data['msg']);
    // Future.delayed(Duration(seconds: 3),()=> Navigator.pushNamed(context, DrawerMenu.routeName));
  }catch(e){
    print('register error');
    print(e.toString());
  }
}



