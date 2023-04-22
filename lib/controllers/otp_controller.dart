import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/screens/screens.dart';

import '../app_state.dart';
import '../constants/local.dart';

void OtpLogin(String touken, BuildContext context) async {
  var dio = Dio();
  try{
    var response = await dio.post(urlapilogin, data: {
      'email': AppState.instance.settingBox.read(SettingType.emaillogin.toString()),
      'password': AppState.instance.settingBox.read(SettingType.passwordlogin.toString()),
      'TokenClient' : touken,
    });
    if(response.statusCode == 200){
      print(response.data);
      // Navigator.pushNamed(context, DrawerMenu.routeName);
    }else{
      print('not 200 state');
      // print(response.);
    }
  }catch(e){
    print('catch otp error');
    print(e.toString());
  }

}