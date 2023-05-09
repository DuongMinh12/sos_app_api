import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/controllers/profile_controller.dart';
import 'package:warning_app/models/models.dart';
import '../../cubit/account/customer_profile/user_pro5_cubit.dart';
import 'components/component_profile_page.dart';

class ProfilePage extends StatefulWidget {
   ProfilePage({Key? key}) : super(key: key);
  static String routeName = 'profilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool ischange = false;
  void onchangevalueTouchID(bool value){
    setState(() {
      ischange = value;
    });
  }

  bool ischangeface = false;
  void onchangevalueFaceID(bool value){
    setState(() {
      ischangeface = value;
    });
  }

  @override
  void initState(){
    super.initState();
    BlocProvider.of<UserPro5Cubit>(context).getUserPro5();
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          ZoomDrawer.of(context)!.open();
          },icon: Icon(Icons.menu, color: Colors.black,),),
        backgroundColor: Colors.white,elevation: 0,
        title: Center(child: Text('Profile', style: txt20!.copyWith(fontWeight: FontWeight.w700),)),
      ),
      body: BlocBuilder<UserPro5Cubit, UserPro5State>(
        builder: (context, state){
          if(state is UserPro5Loading && state.isLoading == true){
            return Center(child:  CircularProgressIndicator(),);
          }
          if(state is UserPro5Loaded){
            if(state.user!= null){
              return SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 50,
                                backgroundImage:NetworkImage((state.user.avatar!=null)? state.user.avatar.toString() : Customer.user.imageUrl!),
                              ),
                              Positioned(
                                  right: 5,
                                  bottom: 0,
                                  child: GestureDetector(
                                    onTap: (){ print('ok');},
                                    child: Container(height: 30, width: 30, alignment: Alignment.center,
                                      child: Icon(Icons.add_a_photo_outlined, color: Colors.white, size: 19,),
                                      decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.circular(99)
                                      ),),
                                  )),
                            ],
                          )),
                      Text(
                       (state.user.name!=null)? state.user.name.toString() : 'Unknow',
                        style: txt18!.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        (state.user.email!=null)? state.user.email.toString() : 'Unknow',
                        style: txt16!.copyWith(fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 20,),
                      buildProfile('User Name', Icons.person, (state.user.name!=null)? state.user.name.toString() : 'Unknow'),
                      buildProfile('Email', Icons.mail_outline, (state.user.email!=null)? state.user.email.toString() : 'Unknow'),
                      buildProfile('Phone Number', Icons.phone, (state.user.phoneNumber!=null)? '${state.user.phoneNumber.hashCode}' : 'xxx-xxx-xxxx'),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                        print('Save');
                      }, child: Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(345, 40),
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )
                        ),),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: kBackground.withAlpha(200),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BiologistID(power: ischange, onChanged: (valu)=> onchangevalueTouchID(valu), title: 'Turn on Touch ID',),
                            Divider(),
                            BiologistID(power:ischangeface, onChanged: (valu)=> onchangevalueFaceID(valu), title: 'Turn on Face ID',),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            else {
              return SingleChildScrollView(
                child: Container(
                  alignment: Alignment.center,
                  child: Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 15),
                          child: Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 50,
                                backgroundImage:NetworkImage(Customer.user.imageUrl!),
                              ),
                              Positioned(
                                  right: 5,
                                  bottom: 0,
                                  child: GestureDetector(
                                    onTap: (){ print('ok');},
                                    child: Container(height: 30, width: 30, alignment: Alignment.center,
                                      child: Icon(Icons.add_a_photo_outlined, color: Colors.white, size: 19,),
                                      decoration: BoxDecoration(
                                          color: kPrimaryColor,
                                          borderRadius: BorderRadius.circular(99)
                                      ),),
                                  )),
                            ],
                          )),
                      Text(
                        'Unknow',
                        style: txt18!.copyWith(fontWeight: FontWeight.w700),
                      ),
                      SizedBox(height: 3,),
                      Text(
                        'Unknow',
                        style: txt16!.copyWith(fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height: 20,),
                      buildProfile('User Name', Icons.person, 'Unknow'),
                      buildProfile('Email', Icons.mail_outline, 'Unknow'),
                      buildProfile('Phone Number', Icons.phone, 'xxx-xxx-xxxx'),
                      SizedBox(height: 20,),
                      ElevatedButton(onPressed: (){
                        print('Save');
                      }, child: Text('Edit Profile'),
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(345, 40),
                            backgroundColor: kPrimaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            )
                        ),),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
                        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                        decoration: BoxDecoration(
                            color: kBackground.withAlpha(200),
                            borderRadius: BorderRadius.circular(12)
                        ),
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            BiologistID(power: ischange, onChanged: (valu)=> onchangevalueTouchID(valu), title: 'Turn on Touch ID',),
                            Divider(),
                            BiologistID(power:ischangeface, onChanged: (valu)=> onchangevalueFaceID(valu), title: 'Turn on Face ID',),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
          }
          else{
            return Center(child: Text('Some thing went wrong'),);
          }
        },
      ),
    );
  }
}
