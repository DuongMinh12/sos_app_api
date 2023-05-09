import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/models/models.dart';
import 'package:warning_app/repositories/customer/user_repository.dart';

part 'user_pro5_state.dart';

class UserPro5Cubit extends Cubit<UserPro5State> {
  UserPro5Cubit() : super(UserPro5Initial());
  UserResponsitory userResponsitory = UserResponsitory();
  User user = User();

  Future getUserPro5() async{
    try{
      emit(UserPro5Loading(isLoading: true));
      var res = await userResponsitory.fetchUserPro5();
      emit(UserPro5Loading(isLoading: false));
      if(res!=null && res.data!=null){
        user = User.fromJson(res.data['data']['result']);
        // print(user.name);
      }
      emit(UserPro5Loaded(user: user));
    }catch(e){
      emit(UserPro5Loading(isLoading: false));
      print(e);
    }
  }
}
