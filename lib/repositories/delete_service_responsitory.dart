import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/constants/utils.dart';

import '../app_state/app_state.dart';
import '../constants/add_all.dart';
import '../screens/recharge/rechargerScreen.dart';

class DeleteServiceResponsitory{
  var dio = Dio();
  var idService = AppState.instance.settingBox.read(SettingType.idService.toString());

  Future deleteService() async{
    // print(idService);
    try{
      var response = await dio.delete(urlDeleteService,
          data: {
        'idService': idService,
          },
          options: Options(
              headers: {
                "Authorization": 'Bearer $token',
              }
          ));
      if(response!=null&&response.data!=null&&response.data['statusCode']==200){
        // Navigator.pushNamed(context, RechargeScreen.routeName);
        Utils.toassMessage(response.data['message']);
      }
      if(response!=null&&response.data!=null&&response.data['statusCode']!=200){
        // Navigator.pushNamed(context, RechargeScreen.routeName);
        Utils.toassMessage(response.data['message']);
      }
      if(response==null || response.data==null){
        // Navigator.pushNamed(context, RechargeScreen.routeName);
        Utils.toassMessage("Some problem service");
      }
      // return response;
    }catch(e){
      print('Deletet acc api error: $e');
    }
  }
}