import 'package:dio/dio.dart';

import '../../app_state/app_state.dart';
import '../../constants/add_all.dart';

class UpdatePro5UserResponsitory{
  Future<Response?> updateUserPro5(String username, String email, int phone) async {
    var dio = Dio();
    var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
    var id = AppState.instance.settingBox.read(SettingType.idUser.toString());
    try{
      dio.options.headers['Authorization'] = 'Bearer $token';
      var response = await dio.post(urlUpdateUserPro5, data: {
        'id': id,
        'name': username,
        'phoneNumber': phone,
        'email': email
      });
      return response;
    }catch(e){
      print(e);
    }
  }
}

//{id, phoneNumber, name, address}