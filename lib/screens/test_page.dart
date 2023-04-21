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

import '../constants/add_all.dart';

 class TestPage extends StatefulWidget {
   TestPage({Key? key}) : super(key: key);
  static String routeName = 'testPage';

  @override
  State<TestPage> createState() => _TestPageState();
}

class _TestPageState extends State<TestPage> {
   TextEditingController _email = TextEditingController();
   TextEditingController _pw = TextEditingController();
   TextEditingController _name = TextEditingController();
   @override
   void initState(){
     super.initState();
     iregister(_email.text, _pw.text, _name.text);
     ilogin(_email.text, _pw.text);
   }

   void iregister(String email, String password, String name) async{

     var dio = Dio();
     try{
       var response = await dio.post(urlapiregister, data: {
         'email': email,
         'password': password,
         'name': name,
       });
       print(response.statusCode);
       print(response.data.toString());
     }catch(e){
       print(e.toString());
     };
   }

   void ilogin(String email, String password) async{
     var urlapi='http://192.168.0.192:3000/api/login';
     var dio = Dio();
     try{
       var response = await dio.post(urlapi, data: {
         'email': email,
         'password': password,
       });
       print(response.statusCode);
       print(response.data.toString());
     }catch(e){
       print(e.toString());
     };
   }

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
         appBar: AppBar(),
         body: Padding(
           padding: EdgeInsets.symmetric(horizontal: 30),
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               TextFormField(
                 controller: _name,
                 decoration: InputDecoration(
                     hintText: 'name'
                 ),
               ),
               TextFormField(
                 controller: _email,
                 decoration: InputDecoration(
                   hintText: 'email'
                 ),
               ),
               TextFormField(
                 controller: _pw,
                 decoration: InputDecoration(
                     hintText: 'password'
                 ),
               ),
               ElevatedButton(onPressed: (){
                 iregister(_email.text.toString(), _pw.text.toString(), _name.text.toString());
               }, child: Text('register')),


               ElevatedButton(onPressed: (){
                 setState(() {
                   ilogin(_email.text.toString(), _pw.text.toString());
                 });
               }, child: Text('login')),
             ],
           ),
         ),
       ),
     );
   }
}





