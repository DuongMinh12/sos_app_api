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
  TextEditingController _pw = TextEditingController();
  // LoginApiModel loginApiModel = LoginApiModel();

  late LoginCubit loginwithCubit;
  // late RegisterCubit registerCubit;

  @override
  void initState() {
    super.initState();
    loginwithCubit = BlocProvider.of<LoginCubit>(context);
    // BlocProvider.of<UserPro5Cubit>(context).getUserPro5();
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              controller: _name,
              decoration: InputDecoration(
                hintText: 'nhập name',
              ),
            ),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                hintText: 'nhập email',
              ),
            ),
            TextFormField(
              controller: _pw,
              decoration: InputDecoration(
                hintText: 'nhập pw',
              ),
            ),
            // SizedBox(child: BlocBuilder<RegisterCubit, RegisterState>(
            //   builder: (context, state){
            //     if(state is RegisterLoading && state.isLoading == true){
            //       return Center(child: CircularProgressIndicator(),);
            //     }
            //     // if(state is RegisterLoaded){
            //     //   if(state.user!=null){
            //     //     return Column(children: [
            //     //       Text(state.user.name.toString()),
            //     //       ElevatedButton(onPressed: (){
            //     //         updateData();
            //     //       }, child: Text('update'))
            //     //     ],);
            //     //   }
            //     //   else{
            //     //     return Center(
            //     //       child: Text('không thể nhận dâta'),
            //     //     );
            //     //   }
            //     // }
            //     return ElevatedButton(onPressed: (){
            //       registerCubit.postRegister(context, _name.text, _email.text, _pw.text);
            //     }, child: Text('register'));
            //   },
            // ),),

            SizedBox(child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state){
                if(state is LoginLoading && state.isLoading == true){
                  return Center(child: CircularProgressIndicator(),);
                }
                return ElevatedButton(onPressed: (){
                  loginwithCubit.postLoginCubit(context, _email.text, _pw.text);
                }, child: Text('register'));
              },
            ),),
          ],
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
  var id = AppState.instance.settingBox.read(SettingType.idUser.toString());
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