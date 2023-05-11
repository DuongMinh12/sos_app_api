import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pinput/pinput.dart';
import 'package:warning_app/constants/add_all.dart';

import '../../app_state/app_state.dart';
import '../../controllers/otp_controller.dart';
import 'components/pin_put_widget.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  static String routeName = 'otpScreen';
  TextEditingController touken = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){ Navigator.pop(context);}, icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),),
      ),
      body:SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 54, vertical: 10),
                  child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_tv9b2eyq.json')),
              Text('Vui lòng xác nhận mã xác minh của bạn', style: txt18,),
              SizedBox(height: 8,),
              Text('Chúng tôi đã gửi mã xác minh về máy của bạn, vui lòng nhập mã xác minh để tiếp tục đăng nhập.', style: txt15, textAlign: TextAlign.center,),
              // SizedBox(height: 10,),
              // Text('${AppState.instance.settingBox.read(SettingType.tokenCode.toString())}', style: TextStyle(color: Colors.black),),
              PinPutWidget(pinputController: touken,),
              ElevatedButton(onPressed: (){
                OtpLogin(touken.text, context);
              }, child: Text('Confirm',),
              style: ElevatedButton.styleFrom(
                backgroundColor: kPrimaryColor,
                minimumSize: Size(330, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(999)
                )
              ),)
            ],
          ),
        ),
      ),
    );
  }
}
