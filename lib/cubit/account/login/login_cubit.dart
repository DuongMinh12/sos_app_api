import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/app_state/app_state.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/screens/home/components/drawer_menu_main_page.dart';
import 'package:warning_app/screens/otp/otp_screen.dart';
import '../../../models/models.dart';
import '../../../repositories/login_responsitory.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  LoginResponse loginResponse = LoginResponse();
  LoginApiModel loginApiModel = LoginApiModel();

  Future postLoginCubit(BuildContext context, String email, String password,) async{
    try{
      emit(LoginLoading(isLoading: true));
      final reponse = await loginResponse.getLogin(email, password);
      emit(LoginLoading(isLoading: false));
      if(reponse != null && reponse.data!=null && reponse.data['statusCode'] == 200 ){
        Utils.toassMessage('Log in success');
        loginApiModel = LoginApiModel.fromJson(reponse.data['data']);
        print('Otpcode: ${reponse.data['data']['otpCode']}');
        AppState.instance.settingBox.write(SettingType.idUser.toString(), reponse.data['data']['id']);
        AppState.instance.settingBox.write(SettingType.accessToken.toString(), reponse.data['data']['accessToken']);
        AppState.instance.settingBox.write(SettingType.emaillogin.toString(), email);
        AppState.instance.settingBox.write(SettingType.passwordlogin.toString(), password);
        // var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
        // print(token);
        Navigator.pushNamed(context, OtpScreen.routeName);
        // print('ok');
      }
      // emit(LoginLoading(isLoading: false));
      emit(LoginLoaded(listlogin: loginApiModel));
      if(reponse == null || reponse.data['statusCode'] == 404 || reponse.data['statusCode'] == 500) {
        Utils.toassMessage('Login Error: ${reponse!.data['message'].toString()}');
      }
    }catch(e){
      emit(LoginLoading(isLoading: false));
      Utils.toassMessage('Login Error: $e');
      print(e.toString());
    }
  }


  Future postRegisterLoginCubit(BuildContext context, String email, String password,) async{
    try{
      final reponse = await loginResponse.getLogin(email, password);
      if(reponse != null && reponse.data!=null || reponse!.data['statusCode'] == 200){
        loginApiModel = LoginApiModel.fromJson(reponse.data['data']);
        // print('Otpcode: ${reponse.data['data']['otpCode']}');
        AppState.instance.settingBox.write(SettingType.idUser.toString(), reponse.data['data']['id']);
        AppState.instance.settingBox.write(SettingType.accessToken.toString(), reponse.data['data']['accessToken']);
        var id = AppState.instance.settingBox.read(SettingType.idUser.toString());
        print(id);
        Navigator.pushNamed(context, DrawerMenu.routeName);
        // print('ok');
      }
      // emit(LoginLoading(isLoading: false));
      emit(LoginLoaded(listlogin: loginApiModel));
      if(reponse!=null && reponse!.data!=null && reponse!.data['statusCode'] != 200) {
        Utils.toassMessage('Login Error: ${reponse!.data['message'].toString()}');
      }
    }catch(e){
      // emit(LoginLoading(isLoading: false));
      print('Login Error: $e');
    }
  }

}
