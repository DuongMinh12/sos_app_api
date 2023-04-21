import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/add_all.dart';

class StackWidgetRed extends StatelessWidget {
  const StackWidgetRed({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          // alignment: Alignment.center,
            height: 50,
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Color(0xFFC72C41), borderRadius: BorderRadius.circular(20)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text('Mật khẩu bạn nhập không đúng'),
            )),
        Positioned(
          child: SvgPicture.asset(
            close,
            height: 30,
            width: 30,
          ),
          top: -10,
          left: -10,),
        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(
            bearteddy,
            height: 60,
            width: 50,
          ),
        ),
      ],
    );
  }
}

class StackWidgetYellow extends StatelessWidget {
  const StackWidgetYellow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
            alignment: Alignment.center,
            height: 50,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(color: Colors.orange, borderRadius: BorderRadius.circular(20)),
            child: Text('Bạn chưa nhập mật khẩu')),
        Positioned(
          child: SvgPicture.asset(
            exclamation,
            height: 30,
            width: 30,
          ),
          top: -10,
          left: -10,),
        Positioned(
          right: 0,
          top: 0,
          child: SvgPicture.asset(
            bearteddy,
            height: 60,
            width: 50,
          ),
        ),
      ],
    );
  }
}