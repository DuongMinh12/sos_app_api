import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:http_parser/http_parser.dart';
import 'package:warning_app/constants/utils.dart';

import '../../app_state/app_state.dart';

class UpdateAvatarRsponsitory{
  var dio = Dio();
  // File? avatar;
  // ImageData imageData = ImageData();

  Future getAvatar(ImageSource source) async{
    final pickerFile = await ImagePicker().pickImage(source: source);
    if(pickerFile==null){
      return;
    }
    try{
      // var filename = pickerFile.path.split('/').last;
      // print(pickedFile.path);
      // var file = File(pickedFile.path);
      FormData dataForm = FormData.fromMap({
        'file': await MultipartFile.fromFile(pickerFile.path, contentType: MediaType("image", "jpeg")),
      });
        // 'type':'file/jpg'
      // print(pickedFile.path);
      await updateAvatarWithApi(dataForm);
    }on PlatformException catch(e){
      print('Failed to pick image: $e');
    }
  }

  // Future<String> uploadImage(File file) async {
  //   String fileName = file.path.split('/').last;
  //   FormData formData = FormData.fromMap({
  //     "file":
  //     await MultipartFile.fromFile(file.path, filename:fileName),
  //   });
  //   var response = await dio.put("/info", data: formData);
  //   return response.data;
  // }

  Future updateAvatarWithApi(var dataform) async{
    var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
    try{
      // dio.options.headers['Authorization']='Bearer $token';
      // dio.options.headers['content-type']='multipart/form-data';
      var response = await dio.put('http://192.168.0.191:3000/api/user/update-avatar', data: {
        'image_avatar': dataform,
      },
          options: Options(headers: {
        "Authorization": 'Bearer $token',
        // 'Content-Type': 'application/json',
        // 'Accept': '*/*',
       'content-type': 'multipart/form-data'
      })
      );
      print(response.data);
      if(response.data!=null){
        Utils.toassMessage(response.data['message']);
      }
      if(response.data==null){
        Utils.toassMessage('Upload không thành công');
      }
      return response;
    }catch(e){
      print(e);
    }
  }
}
//
// class ImageData{
//   var image;
//   ImageData({this.image});
// }