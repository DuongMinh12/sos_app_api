import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/models/models.dart';
import 'package:warning_app/repositories/customer/delete_account_responsitory.dart';
import 'package:warning_app/repositories/customer/update_avatar_responsitory.dart';
import 'package:warning_app/repositories/customer/update_pro5_user_responsitory.dart';
import 'package:warning_app/repositories/customer/user_repository.dart';
import 'package:warning_app/screens/screens.dart';

part 'user_pro5_state.dart';

class UserPro5Cubit extends Cubit<UserPro5State> {
  UserPro5Cubit() : super(UserPro5Initial());
  UserResponsitory userResponsitory = UserResponsitory();
  UpdatePro5UserResponsitory updatePro5UserResponsitory = UpdatePro5UserResponsitory();
  UpdateAvatarRsponsitory updateAvatarRsponsitory = UpdateAvatarRsponsitory();
  DeleteAccountResponsitory deleteAccountResponsitory = DeleteAccountResponsitory();
  User user = User();

  Future getUserPro5() async{
    try{
      emit(UserPro5Loading(isLoading: true));
      var res = await userResponsitory.fetchUserPro5();
      emit(UserPro5Loading(isLoading: false));
      if(res!=null && res.data!=null || res!.data['statusCode'] == 200){
        user = User.fromJson(res.data['data']['result']);
        // print(res.data);
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

  Future updateUserPro5(BuildContext context, String username, String email, String phone) async{
    emit(UserPro5Updating(isLoading: true));
    var res = await updatePro5UserResponsitory.updateUserPro5(username, email, phone);
    emit(UserPro5Updating(isLoading: false));
    try{
      if(res!=null&& res.data!=null && res.data['statusCode'] == 200){
        // Navigator.pushNamed(context, ProfilePage.routeName);
        Utils.toassMessage(res.data['message']);
        // Navigator.pop(context);
      }
      if(res!.data['statusCode'] != 200){
        Utils.toassMessage(res.data['message']);
        print('vhbjkbk');
      }
    }catch(e){
      emit(UserPro5Updating(isLoading: false));
      print('updateUserPro5 Erorr: $e');
    }
  }

  Future updateAvatar(BuildContext context ,ImageSource source) async{
    emit(UserUpdatingAvatar(isLoading: true));
    var response = await updateAvatarRsponsitory.getAvatar(context, source);
    emit(UserUpdatingAvatar(isLoading: false));
    try{
      if(response!=null && response.data!=null){
        Utils.toassMessage(response.data['message']);
      }
    }catch(e){
      emit(UserUpdatingAvatar(isLoading: false));
      print('updateAcater error: $e');
    }
  }

  Future deleteAccount(BuildContext context) async{
    emit(UserPro5Deleting(isLoading: true));
    var response = await deleteAccountResponsitory.deleteUser();
    emit(UserPro5Deleting(isLoading: false));
    try{
      if(response!=null && response.data!=null){
        Utils.toassMessage(response.data['message']);
        Navigator.pushNamed(context, LogInPage.routeName);
      }
    }catch(e){
      emit(UserPro5Deleting(isLoading: false));
      print('deleteAccount error: $e');
    }
  }
}
