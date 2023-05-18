import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/models/state_service_model.dart';

class ChangeStateServiceResponsitory{
  var dio = Dio();
//   StateServiceModel stateServiceModel = StateServiceModel();
// List<StateServiceModel> liststate = [];
  Future putChangeState(String idService, String otp) async{
    try{
      var response = await dio.put(urlChangeState, data: {
        'idService': idService,
        'checkOTP': otp
      },
      options: Options(
        headers: {
          "Authorization": 'Bearer $token',
        }
      ));
      if(response!= null && response.data!=null && response.data['statusCode'] == 200){
       Utils.toassMessage(response.data['message']);
      }
      if(response!= null && response.data!=null && response.data['statusCode'] != 200){
        Utils.toassMessage(response.data['message']);
      }
      if(response==null||response.data==null){
        Utils.toassMessage("Have problem with your action.");
      }
    }catch(e){
      print('Post change state error: $e');
    }
  }

  // Future getStateService() async{
  //
  // }
}