
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';



Container buildProfile (String title, IconData icon, String initialValue){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
    child: TextFormField(
      initialValue: initialValue,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: kPrimaryColor,),
        label: Text(title),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30)
        )
      ),
    ),
  );
}

// Future<dynamic> dialogEditPro5(BuildContext context) {
//   return showDialog(context: context, builder: (context){
//             return AlertDialog(
//               content: Text('gbjhgubjkg'),
//             );
//           });
// }
