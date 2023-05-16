import 'package:dio/dio.dart';
import 'package:warning_app/constants/add_all.dart';

// class ChangeStateResponsitory{
//   Future<Response?> putState(String idService) async{
//     var dio = Dio();
//     try{
//       var response = await dio.put(urlChangeState, data: {
//         'idService': idService
//       });
//       return response;
//     }catch(e){
//       print('Put state error: $e');
//     }
//   }
// }