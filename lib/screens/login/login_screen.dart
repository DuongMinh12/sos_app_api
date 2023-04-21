import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/screens.dart';
import '../signUp/components/componnents_route.dart';
import 'components/components_login.dart';

class LogInPage extends StatelessWidget {
  LogInPage({Key? key}) : super(key: key);
  static String routeName = 'logInPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      //backgroundColor: kBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Positioned(
                  top: -20,
                  left: -50,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  right: -50,
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: kPrimaryColor,
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome Back',
                        style: loginstyle,
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      SvgPicture.asset(login),
                      SizedBox(
                        height: 40,
                      ),
                      LoginTextfield(),
                    ],
                  ),
                )
              ],
            ),
           Row(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               Text('You don\'t have any account? ', style: txt15),
               GestureDetector(child: Text('Register', style: txt15!.copyWith(color: kPrimaryColor, fontWeight: FontWeight.bold),),
               onTap: (){
                 Navigator.pushNamed(context, SignUpBottomSheetSceen.routeName);
               },)
             ],
           )
          ],
        ),
      ),
    );
  }
}
