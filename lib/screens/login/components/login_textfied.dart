import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/services/local_auth/local_auth_service.dart';
import 'package:warning_app/validator/validator.dart';

import '../../../app_state/app_state.dart';
import '../../../constants/add_all.dart';
import '../../../cubit/account/login/login_cubit.dart';
import '../../screens.dart';
import 'components_login.dart';

class LoginTextfield extends StatefulWidget {
  LoginTextfield({
    super.key,
  });

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
  var _emailController = TextEditingController();
  var _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  LoginCubit loginwithCubit = LoginCubit();
}

class _LoginTextfieldState extends State<LoginTextfield> {



  @override
  void initState() {
    super.initState();
    widget._emailController;
    widget._passController;
    widget.loginwithCubit = BlocProvider.of<LoginCubit>(context);
    // LoginWithApi(context, _emailController.text, _passController.text);
    // BioAuth.authenticate();
  }

  @override
  Widget build(BuildContext context) {
    var _email = AppState.instance.settingBox.read(SettingType.emaillogin.toString());
    var _password = AppState.instance.settingBox.read(SettingType.passwordlogin.toString());
    var biometric = AppState.instance.settingBox.read(SettingType.biometricState.toString());

    // print(AppState.instance.settingBox.read(SettingType.emaillogin.toString()));
    // Size size = MediaQuery.of(context).size;
    return Form(
      key: widget._formKey,
      child: Column(
        children: [
          BuildTextFormFile(
            isPass: false,
            // obscureText: false,
            controller: widget._emailController,
            prefixIcon: Icon(
              Icons.email,
              color: kPrimaryColor,
            ),
            title: 'Email',
            validator: (String? value) => ValidatorClass.validatorEmail(value),
          ),
          BuildTextFormFile(
            isPass: true,
            // obscureText: true,
            controller: widget._passController,
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            title: 'Password',
            validator: (String? value) => ValidatorClass.validatePassword(value),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state){
                if(state is LoginLoading && state.isLoading){
                  return Center(child: CircularProgressIndicator(),);
                }
                return Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          if (widget._formKey.currentState!.validate()) {
                            widget.loginwithCubit.postLoginCubit(context, widget._emailController.text, widget._passController.text);
                          }
                        },
                        child: Text(
                          'LOGIN',
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          //minimumSize: Size(size.width*0.8, 45),
                          // padding: EdgeInsets.symmetric(horizontal: 10),
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    // (checkBio == true) ?
                    ElevatedButton(
                      onPressed: () async {
                        if(biometric == true){
                          bool check = await BioAuth.authenticate(context);
                          if(check == true){
                            widget.loginwithCubit.postRegisterLoginCubit(context, _email, _password);
                          }
                          else{
                            Utils.toassMessage('Đăng nhập không thành công.');
                          }
                        }
                        else{
                          showDialog(context: context, builder: (context){
                            return AlertDialog(
                              title: Text('Thông báo'),
                              content: Text('Thiết bị của bạn không hỗ trợ hoặc không được cấp quyền cho tính năng này, vui lòng kiểm tra lại thiết bị của bạn.'),
                              actions: [TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel'))],
                            );
                          });
                        }
                        // print(check);
                      },
                      child: (Platform.isAndroid)
                          ? Icon(Icons.fingerprint)
                          : SizedBox(
                        child: Image.network(
                          faceid,
                          color: Colors.white,
                        ),
                        width: 25,
                        height: 25,
                      ),
                      style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                    )
                  ],
                );
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text('Forgot Password? '),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context, ForgotPasswordPage.routeName);
                  },
                  child: Text('Forgot'),
                  style: TextButton.styleFrom(padding: EdgeInsets.zero, minimumSize: Size.zero),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
