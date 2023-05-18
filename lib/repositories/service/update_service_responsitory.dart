import 'dart:io';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:warning_app/constants/utils.dart';
import '../../app_state/app_state.dart';
import '../../constants/add_all.dart';

class UpdateServiceResponsitory{
  var dio = Dio();
  //var idService = AppState.instance.settingBox.read(SettingType.idService.toString());
  Future <Response?> putUpdateService(String nameService, String linkOn, String linkOff, var pickerFile, String idService) async{
    FormData dataForm = FormData.fromMap({
      'image_avatar': pickerFile!=null? await MultipartFile.fromFile(File(pickerFile.path).path, contentType: MediaType("image", "jpeg")): '',
      'name': nameService,
      'link_on': linkOn,
      'link_off': linkOff,
      'idService': idService
    });
    try{
      var response = await dio.put(urlUpdateService, data: dataForm,
          options: Options(headers: {
            "Authorization": 'Bearer $token',
            'content-type': 'multipart/form-data'
          }));
      return response;
      // print(response.data);
      // if(response!=null&&response.data!=null){
      //   Utils.toassMessage(response.data['message']);
      // }
      // else{
      //   Utils.toassMessage('Kiểm tra lại các bước thực hiện.');
      // }
    }catch(e){
      print('putUpdateService error: $e');
    }
  }
}