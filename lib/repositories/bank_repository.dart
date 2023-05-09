import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';

class BankResponsitory{
  Future <Response?> fetchBankList() async{
    var dio = Dio();
    try{
      var response = await dio.get(urlListbank);
      return response;
    }catch(e){
      print('Error: $e');
    }
  }
}
