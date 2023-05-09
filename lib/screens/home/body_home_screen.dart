import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:warning_app/cubit/list_bank/list_bank_cubit.dart';
import 'package:warning_app/screens/screens.dart';
import '../../constants/add_all.dart';
import '../../cubit/account/customer_profile/user_pro5_cubit.dart';
import '../../widgets/widgets.dart';
import 'components/container_button.dart';

class BodyHomePage extends StatefulWidget {
  const BodyHomePage({Key? key}) : super(key: key);
  static String routeName = 'bodyHomePage';
  @override
  State<BodyHomePage> createState() => _BodyHomePageState();
}

class _BodyHomePageState extends State<BodyHomePage> {
  // String name = 'Unknow';

  // Future getData() async {
  //   await FirebaseFirestore.instance.collection('User').doc(FirebaseAuth.instance.currentUser!.uid).get().then((value) async {
  //     if (value.exists) {
  //       setState(() {
  //         name = value['name'];
  //       });
  //       //cus.id = value.data()!['id'];
  //     }
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // getData();
    BlocProvider.of<UserPro5Cubit>(context).getUserPro5();
  }

  TextEditingController txt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<ListBankCubit>(context).getListBank();
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
                    BlocBuilder<UserPro5Cubit, UserPro5State>(builder: (context, state){
                      if(state is UserPro5Loading && state.isLoading==true){
                        return Center(child: CircularProgressIndicator(),);
                      }
                      if(state is UserPro5Loaded){
                        if(state.user!=null){
                          return Text(
                            'Welcome ${state.user.name} to,',
                            style: txtwelcome,
                          );
                        }
                        else{
                          return Text('Welcome Unknow to', style: txtwelcome,);
                        }
                      }
                      else {return Text("Some thing wrong");}
                    }),
                    Text(
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
                    Container(
                      height: 450,
                      child: GridView(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        children: [
                          ContainerButton(title: 'Khóa nạp tiền', icon: moneyicon, ontap: () {Navigator.pushNamed(context, RechargeScreen.routeName);}),
                          ContainerButton(title: 'Khóa rút tiền', icon: cashmoney, ontap: () {}),
                          ContainerButton(
                              title: 'Đóng hệ thống',
                              icon: systemicon,
                              ontap: () => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ShowAler(title: 'Đóng hệ thống',);
                                  })),
                          ContainerButton(
                              title: 'Bảo trì',
                              icon: maintenance,
                              ontap: () => showDialog(
                                  context: context,
                                  builder: (context) {
                                    return ShowAler(title: 'Bảo trì',);
                                  })),
                        ],
                      ),
                    )
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

// List datahome = [
//   ['Khóa Nạp Tiền', moneyicon, false],
//   ['Khóa Rút Tiền', cashmoney, false],
//   ['Bảo Trì', maintenance, false],
//   ['Đóng Hệ Thống', systemicon, false],
// ];

// void powerSwithChange( bool value, int index) async {
//   // if (value == true) {
//   //   return showDialog(
//   //       context: context,
//   //       builder: (context) {
//   //         return AlertDialog(
//   //           title: Text('Nhập Mật Khẩu'),
//   //           content: TextFormField(
//   //             decoration: InputDecoration(hintText: 'Nhập mật khẩu'),
//   //             controller: txt,
//   //           ),
//   //           actions: [
//   //             TextButton(
//   //                 onPressed: () {
//   //                   setState(() {
//   //                     value = false;
//   //                     datahome[index][2] = value;
//   //                   });
//   //                   Navigator.pop(context);
//   //                 },
//   //                 child: Text('Cancel')),
//   //             TextButton(
//   //                 onPressed: () {
//   //                   if (txt.text == 'admin') {
//   //                     Navigator.pop(context);
//   //                     showDialog(
//   //                         context: context,
//   //                         builder: (context) {
//   //                           return AlertDialog(
//   //                             title: Text('Warning'),
//   //                             content: Text('Bạn có chắc rằng muốn tắt chương trình?'),
//   //                             actions: [
//   //                               TextButton(
//   //                                   onPressed: () {
//   //                                     Navigator.pop(context);
//   //                                   },
//   //                                   child: Text('cancel')),
//   //                               TextButton(
//   //                                   onPressed: () {
//   //                                     Navigator.pop(context);
//   //                                     setState(() {
//   //                                       value = true;
//   //                                       datahome[index][2] = value;
//   //                                     });
//   //                                   },
//   //                                   child: Text('ok'))
//   //                             ],
//   //                           );
//   //                         });
//   //                   } else {
//   //                     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Nhập lại mật khẩu')));
//   //                   }
//   //                 },
//   //                 child: Text('OK')),
//   //           ],
//   //         );
//   //       });
//   // }
//   setState(() {
//     datahome[index][2] = value;
//   });
// }
