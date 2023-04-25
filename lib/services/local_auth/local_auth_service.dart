import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth_ios/local_auth_ios.dart';
import 'package:local_auth_android/local_auth_android.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:warning_app/constants/utils.dart';

class BioAuth{
  static final _auth = LocalAuthentication();
  static final storage = FlutterSecureStorage();
  static Future<bool> canAuthenticate() async => await _auth.canCheckBiometrics || await _auth.isDeviceSupported();

  // static getcanBio() async{
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   await prefs.setBool('canAuth', await canAuthenticate());
  // }
  //
  static Future<bool> authenticate(BuildContext context) async{
    try{
      if(!await canAuthenticate()){
        showDialog(context: context, builder: (context){
          return AlertDialog(
            title: Text('Oops...'),
            content: Text('Điện thoại của bạn không hỗ trợ tính năng này'),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: Text('Cancle'))
            ],
          );
        });
        return false;
      }
      return await _auth.authenticate(
        authMessages: const [
          IOSAuthMessages(
              cancelButton: 'No thank',
          ),
          AndroidAuthMessages(
              signInTitle: 'Log in',
              // cancelButton: 'No thank',
          )
        ],
        localizedReason: 'Enable Biometrics ID to sign in more easiy',
        options: AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
        )
      );
    }catch(e){
      debugPrint("error $e");
      return false;
    }
  }


  // static checkAuthentication() async{
  //   final canCheck = await _auth.canCheckBiometrics;
  //   if(canCheck){
  //     List<BiometricType> availableBiometrics = await _auth.getAvailableBiometrics();
  //
  //     if(Platform.isIOS){
  //       if(availableBiometrics.contains(BiometricType.face)){
  //         final authenticated = await _auth.authenticate(localizedReason: 'Enable face ID to sign in more easiy ');
  //         storage.write(key: 'usingBiometric', value: 'true');
  //       } else { availableBiometrics.contains(BiometricType.fingerprint);}
  //     }
  //   } else{ print('Cant check biometrics');}
  // }
}