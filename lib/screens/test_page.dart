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
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:password_strength_checker/password_strength_checker.dart';
import 'package:warning_app/screens/home/components/drawer_menu_main_page.dart';

import '../constants/add_all.dart';

 class TestPage extends StatefulWidget {
   TestPage({Key? key}) : super(key: key);
  static String routeName = 'testPage';

  @override
  State<TestPage> createState() => _TestPageState();
   final passNotifier = ValueNotifier<PasswordStrength?>(null);
}

class _TestPageState extends State<TestPage> {
   TextEditingController _email = TextEditingController();

   @override
   Widget build(BuildContext context) {
     var _passControllersg=TextEditingController();
     return GestureDetector(
       onTap: (){
         FocusScopeNode currentFocus = FocusScope.of(context);
         if (!currentFocus.hasPrimaryFocus) {
           currentFocus.unfocus();
         }
       },
       child: Scaffold(
         appBar: AppBar(
           leading: IconButton(onPressed: (){
             ZoomDrawer.of(context)!.open();}, icon: Icon(Icons.arrow_back_ios_new_rounded),),
         ),
         body: Padding(
           padding: EdgeInsets.symmetric(horizontal: 30),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.center,
             children: [
               TextFormField(
                 controller: _email,
                 decoration: InputDecoration(
                   hintText: 'text',
                 ),
                 onChanged: (value){
                   widget.passNotifier.value = PasswordStrength.calculate(text: value);
                 },
               ),
               SizedBox(height: 12,),
               PasswordStrengthChecker(strength: widget.passNotifier)
             ],
           ),
         ),
       ),
     );
   }
}






