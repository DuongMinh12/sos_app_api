import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/screens/screens.dart';

import '../app_state.dart';
import '../constants/local.dart';

void OtpLogin(String touken, BuildContext context) async {
  var dio = Dio();
  try{
    var response = await dio.put(urlotp, data: {
      // 'email': AppState.instance.settingBox.read(SettingType.emaillogin.toString()),
      // 'password': AppState.instance.settingBox.read(SettingType.passwordlogin.toString()),
      'otpCode' : touken,
    });
    // print(response.data);
    // print(response.statusCode);

    if(response.statusCode == 200){
      print(response.data);
      // AppState.instance.settingBox.write(SettingType.userTouken.toString(), response.data['userTokens']);
      // print('userTouken: ${AppState.instance.settingBox.read(SettingType.userTouken.toString())}');
      Future.delayed(Duration(seconds: 2),()=> Navigator.pushNamed(context, DrawerMenu.routeName));
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