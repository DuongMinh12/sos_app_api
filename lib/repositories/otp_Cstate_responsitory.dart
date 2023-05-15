import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';

class OtpChangeStateResponsitory {
  Future<Response?> getotpState() async {
    var dio = Dio();
    try {
      var response = await dio.get(urlOtpState);
      return response;
    } catch (e) {
      print("Get otp state error: $e");
    }
  }
}
