import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/app_state.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/screens/otp/otp_screen.dart';

import '../../../controllers/login_controller.dart';
import '../../../models/account/loginapi.dart';
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
      if(reponse != null && reponse.data!=null){
        Utils.toassMessage('Log in success');
        loginApiModel = LoginApiModel.fromJson(reponse.data['data']);
        print('Otpcode: ${reponse.data['data']['otpCode']}');
        AppState.instance.settingBox.write(SettingType.idUser.toString(), reponse.data['data']['id']);
        AppState.instance.settingBox.write(SettingType.accessToken.toString(), reponse.data['data']['accessToken']);
        // var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
        // print(token);
        Navigator.pushNamed(context, OtpScreen.routeName);
      }
      // emit(LoginLoading(isLoading: false));
      emit(LoginLoaded(listlogin: loginApiModel));
      if(reponse == null || reponse.data['statusCode'] == 404 || reponse.data['statusCode'] == 500) {
        Utils.toassMessage('Login Error: ${reponse!.data['message'].toString()}');
      }
    }catch(e){
      emit(LoginLoading(isLoading: false));
      print(e.toString());
    }
  }

}
