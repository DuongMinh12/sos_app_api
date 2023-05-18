import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';

class ListServiceResponsitory{
  Future<Response?> getListService(String type) async{
    var dio = Dio();
    try{
      dio.options.headers['Authorization']='Bearer $token';
      var response = await dio.get(urlGetListService, data: {
        "type": type
      });
      return response;
    }catch(e){
      print('Get list service error: $e');
    }
  }
}