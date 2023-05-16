import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/cubit/account/login/login_cubit.dart';
import 'package:warning_app/repositories/customer/register_responsitory.dart';
import 'package:warning_app/screens/screens.dart';
import '../../../models/models.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());
  RegisterResponsitory registerResponsitory = RegisterResponsitory();
  RegisterDataModel registerdata = RegisterDataModel();
  ErrorAccountModel errorAccountModel =ErrorAccountModel();
  // LoginResponse loginResponse = LoginResponse();
  LoginCubit loginCubit = LoginCubit();

  Future postRegister(BuildContext context, String name, String email, String password) async{
    emit(RegisterLoading(isLoading: true));
    var response = await registerResponsitory.postRegister(name, email, password);
    emit(RegisterLoading(isLoading: false));
    try{
      if(response!=null && response.data!=null && response!.data['statusCode'] == 200){
        registerdata = RegisterDataModel.fromJson(response.data['data']);
       // loginCubit.postRegisterLoginCubit(context, email, password);
        Navigator.pushNamed(context, LogInPage.routeName);
        Utils.toassMessage(response.data['message']);
      }
      if(response!=null && response!.data!=null && response!.data['statusCode'] != 200){
        Utils.toassMessage(response!.data['message']);
        // errorAccountModel = ErrorAccountModel.fromJson(response.data['message']);
        // print(response!.data['message']);
        // emit(RegisterLoaded(errorAccountModel: errorAccountModel));
      }
      emit(RegisterLoaded(registerDataModel: registerdata));
    }catch(e){
      emit(RegisterLoading(isLoading: false));
      // Utils.toassMessage('Register Error: $e');
      print('Error Register: $e');
    }
  }

}
