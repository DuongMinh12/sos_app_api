import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:warning_app/constants/utils.dart';

import '../../app_state/app_state.dart';
import '../../constants/add_all.dart';

class UpdateAvatarRsponsitory{
  var dio = Dio();
  // File? avatar;

///update avatar
  Future getAvatar(BuildContext context ,ImageSource source) async {
    final pickerFile = await ImagePicker().pickImage(source: source);
    if (pickerFile == null) {
      return;
    }
    try {
      FormData dataForm = FormData.fromMap({
        'image_avatar': await MultipartFile.fromFile(File(pickerFile.path).path, contentType: MediaType("image", "jpeg")),
      });
      await updateAvatarWithApi(context, dataForm);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  Future updateAvatarWithApi(BuildContext context ,var dataform) async{
    try{
      // dio.options.headers['Authorization']='Bearer $token';
      // dio.options.headers['content-type']='multipart/form-data';
      var response = await dio.put('http://192.168.0.191:3000/api/user/update-avatar', data: dataform,
          options: Options(headers: {
        "Authorization": 'Bearer $token',
       'content-type': 'multipart/form-data'
      })
      );
      print(response.data);
      if(response.data!=null){
        Navigator.pop(context);
        Utils.toassMessage(response.data['message']);
      }
      if(response.data==null){
        Navigator.pop(context);
        Utils.toassMessage('Upload không thành công');
      }
      return response;
    }catch(e){
      print(e);
    }
  }

  /// upload image

  // Future getImage(BuildContext context ,ImageSource source, String type) async {
  //   final pickerFile = await ImagePicker().pickImage(source: source);
  //   if (pickerFile == null) {
  //     return;
  //   }
  //   try {
  //     FormData dataForm = FormData.fromMap({
  //       'type': type,
  //       'image_avatar': await MultipartFile.fromFile(File(pickerFile.path).path, contentType: MediaType("image", "jpeg")),
  //     });
  //     await upLoadImage(context, dataForm);
  //   } on PlatformException catch (e) {
  //     print('Failed to pick image: $e');
  //   }
  // }
  //
  // Future upLoadImage(BuildContext context, var data) async{
  //   try{
  //     var response = await dio.put(uploadImage, data: data,
  //         options: Options(headers: {
  //           "Authorization": 'Bearer $token',
  //           'content-type': 'multipart/form-data'
  //         })
  //     );
  //     print(response.data);
  //     if(response.data!=null){
  //       Navigator.pop(context);
  //       Utils.toassMessage(response.data['message']);
  //     }
  //     if(response.data==null){
  //       Navigator.pop(context);
  //       Utils.toassMessage('Upload không thành công');
  //     }
  //     return response;
  //   }catch(e){
  //     print(e);
  //   }
  // }

}
//
// class ImageData{
//   var image;
//   ImageData({this.image});
// }