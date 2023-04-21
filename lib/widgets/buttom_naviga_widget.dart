import 'package:flutter/material.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/screens/screens.dart';

class BottomNaviga extends StatelessWidget {
  const BottomNaviga({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: kMainColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(onPressed: (){
            Navigator.pushNamed(context, BodyHomePage.routeName);
          }, icon: Icon(Icons.home, color: Colors.white,)),
          IconButton(onPressed: (){}, icon: Icon(Icons.person, color: Colors.white)),
          IconButton(onPressed: (){}, icon: Icon(Icons.question_mark, color: Colors.white)),
        ],
      ),
    );
  }
}
