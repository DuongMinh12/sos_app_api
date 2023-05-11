import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/models/models.dart';
import 'package:warning_app/repositories/customer/update_pro5_user_responsitory.dart';
import 'package:warning_app/repositories/customer/user_repository.dart';

part 'user_pro5_state.dart';

class UserPro5Cubit extends Cubit<UserPro5State> {
  UserPro5Cubit() : super(UserPro5Initial());
  UserResponsitory userResponsitory = UserResponsitory();
  UpdatePro5UserResponsitory updatePro5UserResponsitory = UpdatePro5UserResponsitory();
  User user = User();

  Future getUserPro5() async{
    try{
      emit(UserPro5Loading(isLoading: true));
      var res = await userResponsitory.fetchUserPro5();
      emit(UserPro5Loading(isLoading: false));
      if(res!=null && res.data!=null || res!.data['statusCode'] == 200){
        user = User.fromJson(res.data['data']['result']);
        // print(user.name);
      }
      emit(UserPro5Loaded(user: user));
      if(res!=null && res.data!=null && res!.data['statusCode'] != 200){
        Utils.toassMessage(res.data['message']);
      }
    }catch(e){
      emit(UserPro5Loading(isLoading: false));
      print(e);
    }
  }

  Future updateUserPro5(String username, String email, int phone) async{
    emit(UserPro5Updating(isLoading: true));
    var res = await updatePro5UserResponsitory.updateUserPro5(username, email, phone);
    emit(UserPro5Updating(isLoading: false));
    try{
      if(res!=null&& res.data!=null && res.data['statusCode'] == 200){

      }
      if(res!.data['statusCode'] != 200){
        Utils.toassMessage(res.data['message']);
      }

    }catch(e){
      emit(UserPro5Updating(isLoading: false));
      print(e);
    }
  }
}
