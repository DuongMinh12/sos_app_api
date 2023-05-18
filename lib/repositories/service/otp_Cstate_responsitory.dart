import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/constants/utils.dart';

class OtpChangeStateResponsitory {
  var dio = Dio();
  Future getotpState() async {
    try {
      var response = await dio.get(urlOtpState, options: Options(
        headers: {
          "Authorization": 'Bearer $token',
        }
      ));
      if(response.data!=null && response.data['statusCode']==200){
        Utils.toassMessage(response.data['message']);
      }
      if(response.data!=null && response.data['statusCode']!=200){
        Utils.toassMessage(response.data['message']);
      }
    } catch (e) {
      print("Get otp state error: $e");
    }
  }
}
