import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';

class LoginResponse{
  Future <Response?> getLogin(String email, String password) async{
    var dio = Dio();
    try{
      var response = await dio.post(urlapilogin, data: {
        'email': email,
        'password': password,
      });
      return response;
    }catch(e){
      print(e.toString());
    }
  }
}