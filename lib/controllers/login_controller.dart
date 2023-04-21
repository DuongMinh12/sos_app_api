
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/screens/home/components/drawer_menu_main_page.dart';

import '../constants/add_all.dart';

void LogIn(BuildContext context, String email, String password){
  FirebaseAuth loginAuth = FirebaseAuth.instance;

  try{
    loginAuth.signInWithEmailAndPassword(email: email, password: password).then((value) {
      Utils.toassMessage('Log In sucessfully');
      Future.delayed(Duration(seconds: 2),()=> Navigator.pushNamed(context, DrawerMenu.routeName));
    }).onError((error, stackTrace) {
      print(error.toString());
    });
  }catch(e){
    print(e.toString());
  }
}

void LoginWithApi(BuildContext context, String email, String password) async{
  var dio = Dio();
  try{
    var response = await dio.post(urlapilogin, data: {
      'email': email,
      'password': password,
    });
    if(response.statusCode==200){
      Utils.toassMessage('Login successfully');
      Future.delayed(Duration(seconds: 2),()=> Navigator.pushNamed(context, DrawerMenu.routeName));
      print(response.data);
    }else{
      print('not 200 state');
      print(response.statusCode);
      print(response.statusMessage);
    }
  }catch(e){
    print('login error');
    print(e.toString());
  };
}