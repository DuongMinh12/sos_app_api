import 'dart:async';

import 'package:flutter/material.dart';
import 'package:warning_app/app_state/app_state.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:lottie/lottie.dart';
import 'package:warning_app/repositories/check_token_responsitory.dart';
import 'package:warning_app/screens/screens.dart';
import 'package:warning_app/services/splash_services.dart';

import '../home/components/drawer_menu_main_page.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key? key}) : super(key: key);
  static String routeName = 'splashPage';
  @override
  State<SplashPage> createState() => _SplashPageState();
  CheckTokenResponsitory checkTokenResponsitory =CheckTokenResponsitory();
}

class _SplashPageState extends State<SplashPage> {
  ///log vào mượt hơn là gọi thẳng funtion
  // SplashService service = SplashService();
  // @override
  // void initState(){
  //   super.initState();
  //   service.isLogIn(context);
  // }

  @override
  void initState() {
    super.initState();
    widget.checkTokenResponsitory.checkToken();
    Future.delayed(Duration(seconds: 4), ()=> Navigator.pushNamed(context,AppState.instance.settingBox.read(SettingType.accessToken.toString())!=null? DrawerMenu.routeName: LogInPage.routeName));
  }

  @override
  Widget build(BuildContext context) {
    //isLogIn(context);
    // Timer(Duration(seconds: 4), ()=>Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> DrawerMenu())));
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
            'SOS App',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 50,
              fontFamily: 'Pacifico'
            ),
          ),
          // SizedBox(height: 10,),
            ClipRRect(
              borderRadius: BorderRadius.circular(99),
                child: Lottie.asset(bear),
            ),
            Lottie.asset(welcome),
          ],
        ),
      ),
    );
  }
}
