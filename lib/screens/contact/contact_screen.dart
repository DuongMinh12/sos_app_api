import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:lottie/lottie.dart';
import 'package:warning_app/constants/add_all.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: IconButton(icon: Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black,),
          onPressed: (){
            ZoomDrawer.of(context)!.open();
          },),
        ),
        title: Center(child: Text('Request Help', style: txt20,)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            Container(margin: EdgeInsets.only(left: 30, right: 30, bottom: 20, top: 5),
                child: ClipRRect(child: Lottie.asset(customerSuport),
                borderRadius: BorderRadius.circular(999),)),
            Text('How can we help you?', style: txt18,),
            SizedBox(height: 10,),
            Text('It looks like you are in trouble, please contact us for help by the method below', style: txt16!.copyWith(fontWeight: FontWeight.normal),
            textAlign: TextAlign.center,),
            SizedBox(height: 15,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                contactUs('Chat with us', smspngNetword),
                contactUs('Email us', emailNetword),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Container contactUs( String title, String imagesicon){
    return Container(
      //alignment: Alignment.center,
      height: 170,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        // gradient: LinearGradient(
        //   begin: Alignment.topLeft,
        //   end: Alignment.centerRight,
        //   colors: [
        //     Colors.indigoAccent.shade200,
        //     Colors.lightBlue.shade300,
        //   ]
        // ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [BoxShadow(
          color: Colors.grey.shade300,
          blurRadius: 15,
          //offset: Offset(10, 10)
        )]
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 50,
            width: 50,
            child: Image.network(imagesicon),
          ),
          SizedBox(height: 15,),
          Text(title, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
        ],
      ),
    );
  }
}
