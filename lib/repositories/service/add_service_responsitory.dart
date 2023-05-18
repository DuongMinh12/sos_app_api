import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'package:dio/dio.dart';
import '../../constants/local.dart';

class AddServiceResponsitory{

  Future<Response?>postService(String nameService, String linkOn, String linkOff, String type, var pickerFile) async{
    var dio = Dio();
    FormData dataForm = FormData.fromMap({
      'image_avatar': pickerFile!=null? await MultipartFile.fromFile(File(pickerFile.path).path, contentType: MediaType("image", "jpeg")): '',
      'name': nameService,
      'link_on': linkOn,
      'link_off': linkOff,
      'type': type
    });
    try{
      // dio.options.headers['Authorization']='Bearer $token';
      var response = await dio.post(urlAddService, data: dataForm, options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'content-type': 'multipart/form-data'
        }
      )
      // {
      //   'name': nameService,
      //   'link_on': linkOn,
      //   'link_off': linkOff,
      //   'type': type
      // }
      );
      // print(response.data);
      return response;
    }catch(e){
      print('Add service error: $e');
    }
  }
}