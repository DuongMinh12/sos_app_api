// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:warning_app/models/change_state_model.dart';
// import 'package:warning_app/widgets/widgets.dart';
//
// class TestPage extends StatelessWidget {
//   static String routeName ='testPage';
//   // final String tittle;
//   TestPage({
//     //required this.testchange,
//     Key? key, //required this.changeStateModel
//   }) : super(key: key);
//   //bool changeStateModel;
//   //bool testchange;
//   bool? test;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('hbjbjh'),),
//       body: Center(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: (){
//                 showDialog(context: context, builder: (context){
//                   return CustomAlertDialog();
//                 });
//               },
//               child: Text('click me'),
//             ),
//             SizedBox(height: 20,),
//
//             Container(
//               color: (test==true)? Colors.blue: Colors.red,
//               height: 100,
//               width: 100,
//             ),
//             ElevatedButton(
//               onPressed: () async{
//                   await showDialog(context: context, builder: (context){
//                     return CustomAlertDialog();
//                   });
//                 //test = testchange;
//                 if(test == true){
//                   print('corect');
//                 } else {
//                   print('faile');
//                 }
//               },
//               child: Text('changestate button'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:warning_app/cubit/account/customer_profile/user_pro5_cubit.dart';
import 'package:warning_app/cubit/account/register/register_cubit.dart';
import 'package:warning_app/models/account/loginapi.dart';
import 'package:warning_app/repositories/customer/update_avatar_responsitory.dart';
import 'package:warning_app/screens/home/components/drawer_menu_main_page.dart';

import '../app_state/app_state.dart';
import '../constants/add_all.dart';
import '../cubit/account/login/login_cubit.dart';

class TestPage extends StatefulWidget {
  TestPage({Key? key}) : super(key: key);
  static String routeName = 'testPage';

  @override
  State<TestPage> createState() => _TestPageState();
  final passNotifier = ValueNotifier<PasswordStrength?>(null);
}

class _TestPageState extends State<TestPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phone = TextEditingController();
  UpdateAvatarRsponsitory updateAvatarRsponsitory = UpdateAvatarRsponsitory();
  // LoginApiModel loginApiModel = LoginApiModel();

  // late LoginCubit loginwithCubit;
  // late RegisterCubit registerCubit;
  UserPro5Cubit userPro5Cubit = UserPro5Cubit();

  @override
  void initState() {
    super.initState();
    _name.text;
    _email.text;
    _phone.text;
    // loginwithCubit = BlocProvider.of<LoginCubit>(context);
    BlocProvider.of<UserPro5Cubit>(context).getUserPro5();
    // registerCubit = BlocProvider.of<RegisterCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
    // var _passControllersg = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {
          ZoomDrawer.of(context)!.open();
        }, icon: Icon(Icons.arrow_back_ios_new_rounded),),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // SizedBox(child: BlocBuilder<UserPro5Cubit, UserPro5State>(
              //   builder: (context, state){
              //     if(state is UserPro5Loading && state.isLoading == true){
              //       return Center(child: CircularProgressIndicator(),);
              //     }
              //     if(state is UserPro5Loaded){
              //       _name.text =state.user.name.toString();
              //       _email.text =state.user.email.toString();
              //       _phone.text ='${state.user.phoneNumber}';
              //       return Column(
              //         children: [
              //           TextFormField(
              //             controller: _name,
              //             decoration: InputDecoration(
              //               hintText: 'nhập name',
              //             ),
              //           ),
              //           TextFormField(
              //             controller: _email,
              //             decoration: InputDecoration(
              //               hintText: 'nhập email',
              //             ),
              //           ),
              //           TextFormField(
              //             controller: _phone,
              //             decoration: InputDecoration(
              //               hintText: 'nhập pw',
              //             ),
              //           ),
              //           ElevatedButton(onPressed: (){
              //             // loginwithCubit.postLoginCubit(context, _email.text, _pw.text);
              //             userPro5Cubit.updateUserPro5(context, _name.text, _email.text, _phone.text);
              //             // print(_name.text);
              //             // print(_email.text);
              //             // print(_phone.text);
              //           }, child: Text('register')),],
              //       );
              //     }
              //     else{
              //       return SizedBox();
              //     }
              //   },
              // ),),
              CircleAvatar(
                radius: 40,
                // maxRadius: 50,
                backgroundColor: kBackground.withAlpha(100),
                child: Icon(Icons.person),
              ),
              ElevatedButton(onPressed: (){
                // updateAvatarRsponsitory.getAvatarWithGallery();
              }, child: Text('update avatar')),
              ElevatedButton(onPressed: (){
                // updateAvatarRsponsitory.getAvatarWithGallery();
              }, child: Text('update avatar with camera')),
              IntrinsicHeight(
                child: Row(
                  children: [
                   VerticalDivider(),
                    Container(
                      height: 70,
                      width: 70,
                      color: Colors.blue,
                    )
                  ],
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}

// void fecthData() async {
//   var dio = Dio();
//   var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
//   var id = AppState.instance.settingBox.read(SettingType.idUser.toString());
//   // print(token);
//   // print(id);
//   try {
//     dio.options.headers['Authorization'] = 'Bearer $token';
//     var response = await dio.get(local+'/api/user/$id');
//     if (response.data != null) {
//       //print('success');
//       print(response.statusCode);
//       print(response.data.toString());
//     }
//
//   } catch (e) {
//     print(e.toString());
//   }
// }


void updateData() async {
  var dio = Dio();
  var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
  // var id = AppState.instance.settingBox.read(SettingType.idUser.toString());
  // print(token);
  // print(id);
  try {
    dio.options.headers['Authorization'] = 'Bearer $token';
    var response = await dio.put(local+'/api/user/update-user-profile', data: {
      'name': 'Cale'
    });
    if (response.data != null) {
      //print('success');
      print(response.statusCode);
      print(response.data.toString());
    }

  } catch (e) {
    print(e.toString());
  }
}

// GestureDetector(
// onTap: () {
// FocusScopeNode currentFocus = FocusScope.of(context);
// if (!currentFocus.hasPrimaryFocus) {
// currentFocus.unfocus();
// }
// },
// child: Scaffold(
// appBar: AppBar(
// leading: IconButton(
// onPressed: () {
// ZoomDrawer.of(context)!.open();
// },
// icon: Icon(Icons.arrow_back_ios_new_rounded),
// ),
// ),
// body: Padding(
// padding: EdgeInsets.symmetric(horizontal: 30),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// TextFormField(
// controller: _email,
// decoration: InputDecoration(
// hintText: 'email',
// ),
// onChanged: (value) {
// widget.passNotifier.value = PasswordStrength.calculate(text: value);
// },
// ),
// TextFormField(
// controller: _pw,
// decoration: InputDecoration(
// hintText: 'password',
// ),
// onChanged: (value) {
// widget.passNotifier.value = PasswordStrength.calculate(text: value);
// },
// ),
// SizedBox(
// height: 12,
// ),
// PasswordStrengthChecker(strength: widget.passNotifier),
// SizedBox(child: BlocBuilder<LoginCubit, LoginState>(builder: (context, state){
// if(state is LoginLoading){
// return Center(child: CircularProgressIndicator(),);
// }
// return ElevatedButton(onPressed: (){
// loginwithCubit.loginCubit(context, _email.text, _pw.text);
// }, child: Text('ok'));
// },)),
// ],
// ),
// ),
// ),
// )