import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:warning_app/screens/home/body_home_screen.dart';
import 'package:warning_app/screens/screens.dart';
import 'widgets.dart';
import '../constants/add_all.dart';

class BackGroundButtonWidget extends StatelessWidget {
  BackGroundButtonWidget({ required this.child, required this.title, required this.type, required this.routename,
    super.key,
  });
  Widget child;
  String title;
  String type;
  String routename;
  // VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(onPressed: (){Navigator.pushNamed(context, DrawerMenu.routeName);}, icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),),
        title: Text(title, style: TextStyle(color: Colors.black),),
        actions: [
          IconButton(onPressed: (){
            showDialog(context: context, builder: (context){
              return BuilAlerDialog(type: type, routename: routename,);
            });
          }, icon: Icon(CupertinoIcons.plus_app, color: Colors.black,))
        ],
      ),
      body: Container(
        alignment: AlignmentDirectional.topCenter,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0,),
              child: SvgPicture.asset(login),
            ),
            child,
          ],
        ),
      ),
    );
  }
}