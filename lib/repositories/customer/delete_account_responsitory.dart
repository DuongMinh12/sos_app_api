import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';

class DeleteAccountResponsitory{
  var dio = Dio();
  Future<Response?> deleteUser() async{
    try{
      var response = await dio.delete(urlDeleAcc,
          options: Options(
              headers: {
                "Authorization": 'Bearer $token',
              }
          ));
      return response;
    }catch(e){
      print('Deletet acc api error: $e');
    }
  }
}