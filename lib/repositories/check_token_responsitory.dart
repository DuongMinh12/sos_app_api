import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';

import '../app_state/app_state.dart';

class CheckTokenResponsitory{
  var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
  var dio = Dio();
  Future checkToken() async{
    try{
      var response = await dio.get(urlapiUserPro5, options: Options(headers: {
        "Authorization": 'Bearer $token',
      }));
      if(response==null&&response.data==null){
        AppState.instance.settingBox.remove(SettingType.accessToken.toString());
      }
      // print('object');
    }catch(e){
      print('CheckTokenResponsitory error: $e');
    }
  }
}