import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../constants/add_all.dart';
import '../../models/models.dart';
import '../../widgets/widgets.dart';
import '../screens.dart';
import 'components/drawer_menu_main_page.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);
  static String routeName = 'bodyHomePage';
  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  String name ='Unknow';

  Future getData() async{
    await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) async{
      if(value.exists){
        setState(() {
          name = value['name'];
        });
        //cus.id = value.data()!['id'];
      }
    });
  }
  @override
  void initState(){
    super.initState();
    getData();
  }
  TextEditingController txt = TextEditingController();

  List datahome = [
    ['Khóa Nạp Tiền', moneyicon, false],
    ['Khóa Rút Tiền', cashmoney, false],
    ['Bảo Trì', maintenance, false],
    ['Đóng Hệ Thống', systemicon, false],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.open();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                print('notices');
                //Navigator.pushNamed(context, ProfilePage.routeName);
              },
              icon: Icon(
                CupertinoIcons.bell,
                color: Colors.black,
              ))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          //padding: EdgeInsets.only(top: 0),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Welcome ${name} to,',
                      style: txtwelcome,
                    ),
                    const Text(
                      'SOS App',
                      style: txthomestitle,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    const Divider(
                      thickness: 1,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'System Management',
                      style: txt18,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                   // GestureDetector(
                   //   onTap: (){},
                   //   child: Container(
                   //     height: 70,
                   //     width: 65,
                   //     decoration: BoxDecoration(
                   //       color: kBackground,
                   //       borderRadius: BorderRadius.circular(10)
                   //     ),
                   //     child: Icon(CupertinoIcons.plus_circle, color: Colors.white, size: 40,),
                   //   ),
                   // )
                    ElevatedButton(onPressed: (){}, child: Icon(CupertinoIcons.plus_circled, size: 40,),
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(65, 70),
                      backgroundColor: kBackground,
                    ),)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// Container(
// height: 450,
// child: GridView.builder(
// //primary: false,
// //physics: NeverScrollableScrollPhysics(),
// itemCount: datahome.length,
// gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 1 / 1.1),
// itemBuilder: (context, indext) {
// return SmartDevicesWidget(
// devicesname: datahome[indext][0],
// devicesicon: datahome[indext][1],
// power: datahome[indext][2],
// onChanged: (value) => powerSwithChange(value, indext),
// );
// }),
// )


// void powerSwithChange(bool value, int index) async {
//   if (value == true) {
//     return showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             title: Text('Nhập Mật Khẩu'),
//             content: TextFormField(
//               decoration: InputDecoration(hintText: 'Nhập mật khẩu'),
//               controller: txt,
//             ),
//             actions: [
//               TextButton(
//                   onPressed: () {
//                     setState(() {
//                       value = false;
//                       datahome[index][2] = value;
//                     });
//                     Navigator.pop(context);
//                   },
//                   child: Text('Cancel')),
//               TextButton(
//                   onPressed: () {
//                     if (txt.text == 'admin') {
//                       Navigator.pop(context);
//                       showDialog(
//                           context: context,
//                           builder: (context) {
//                             return AlertDialog(
//                               title: Text('Warning'),
//                               content: Text('Bạn có chắc rằng muốn tắt chương trình?'),
//                               actions: [
//                                 TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                     },
//                                     child: Text('cancel')),
//                                 TextButton(
//                                     onPressed: () {
//                                       Navigator.pop(context);
//                                       setState(() {
//                                         value = true;
//                                         datahome[index][2] = value;
//                                       });
//                                     },
//                                     child: Text('ok'))
//                               ],
//                             );
//                           });
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Nhập lại mật khẩu')));
//                     }
//                   },
//                   child: Text('OK')),
//             ],
//           );
//         });
//   }
//   setState(() {
//     datahome[index][2] = value;
//   });
// }