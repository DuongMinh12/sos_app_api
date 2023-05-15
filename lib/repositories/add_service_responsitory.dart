import 'package:dio/dio.dart';
import '../constants/local.dart';

class AddServiceResponsitory{
  Future<Response?>postService(String nameService, String linkOn, String linkOff, String type) async{
    var dio = Dio();
    try{
      dio.options.headers['Authorization']='Bearer $token';
      var response = await dio.post(urlAddService, data: {
        'name': nameService,
        'link_on': linkOn,
        'link_off': linkOff,
        'type': type
      });
      // print(response.data);
      return response;
    }catch(e){
      print('Add service error: $e');
    }
  }
}