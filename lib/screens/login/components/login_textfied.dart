import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/controllers/login_controller.dart';
import 'package:warning_app/services/local_auth/local_auth_service.dart';
import 'package:warning_app/validator/validator.dart';

import '../../../app_state.dart';
import '../../../constants/add_all.dart';
import '../../screens.dart';
import 'components_login.dart';

class LoginTextfield extends StatefulWidget {
  LoginTextfield({
    super.key,
  });

  @override
  State<LoginTextfield> createState() => _LoginTextfieldState();
}

class _LoginTextfieldState extends State<LoginTextfield> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var _email = AppState.instance.settingBox.read(SettingType.emaillogin.toString());
  var _password = AppState.instance.settingBox.read(SettingType.passwordlogin.toString());

  @override
  void initState() {
    super.initState();
    LoginWithApi(context, _emailController.text, _passController.text);
    // BioAuth.authenticate();
  }

  @override
  Widget build(BuildContext context) {
    // print(AppState.instance.settingBox.read(SettingType.emaillogin.toString()));
    // Size size = MediaQuery.of(context).size;
    return Form(
      key: _formKey,
      child: Column(
        children: [
          BuildTextFormFile(
            isPass: false,
            // obscureText: false,
            controller: _emailController,
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
            controller: _passController,
            prefixIcon: Icon(
              Icons.lock,
              color: kPrimaryColor,
            ),
            title: 'Password',
            validator: (String? value) => ValidatorClass.validatePassword(value),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 45),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        LoginWithApi(context, _emailController.text, _passController.text);
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
                    bool check = await BioAuth.authenticate(context);
                    if(check == true){
                      LoginWithApi(context, _email, _password);
                    }
                    else{
                      Utils.toassMessage('Đăng nhập không thành công.');
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
                // : SizedBox(),
              ],
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
