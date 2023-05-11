import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:warning_app/constants/add_all.dart';

class RegisterResponsitory{
  var dio = Dio();

  Future<Response?> postRegister(String name, String email, String password) async{
    try{
      var response = await dio.post(urlapiregister, data: {
        "name": name,
        "email": email,
        "password": password
      });
      return response;
    }catch(e){
      print(e);
    }
  }
}