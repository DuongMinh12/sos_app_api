import 'package:flutter/material.dart';
import 'package:warning_app/validator/validator.dart';

import '../constants/add_all.dart';

final GlobalKey<FormState> _key = GlobalKey<FormState>();

AlertDialog buildAlertDialog(BuildContext context) {
  return AlertDialog(
    titleTextStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
    title: Text('Vui lòng điền thông tin: ',),
    content: Container(
      // height: 220,
      width: 300,
      child: Form(
        key: _key,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          // crossAxisAlignment: CrossAxisAlignment.start,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FormInfor('Name:  ', (String? value) => ValidatorClass.validateFormName(value)),
            FormInfor('Link on:', (String? value) => ValidatorClass.validateFormLink(value)),
            FormInfor('Link off:', (String? value) => ValidatorClass.validateFormLink(value)),
            ListTile(
              contentPadding: EdgeInsets.symmetric(horizontal: 0),
              leading: Text('Icon avatar:', style: TextStyle(fontSize: 15),),
              title: ElevatedButton(onPressed: (){}, child: Text('Upload image'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor
                ),),
            )
          ],
        ),
      ),
    ),
    actions: [
      TextButton(
        onPressed: (){
          Navigator.pop(context);
        },
        child: Text('Cancel', style: TextStyle(color: kPrimaryColor, fontSize: 16)),
      ),
      TextButton(
        onPressed: (){
          if(_key.currentState!.validate()){

          }
        },
        child: Text('Submit', style: TextStyle(color: kPrimaryColor, fontSize: 16)),
      )
    ],
    actionsAlignment: MainAxisAlignment.spaceBetween,
    contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
    actionsPadding: EdgeInsets.symmetric(horizontal: 10),
  );
}


FormInfor (String title, String? Function(String?)? validator){
  return ListTile(
    // minVerticalPadding: 0,
    // minLeadingWidth: 20,
    contentPadding: EdgeInsets.symmetric(horizontal: 0),
    leading: Text(title, style: TextStyle(fontSize: 15),),
    title: TextFormField(
      validator: validator,
      cursorColor: kPrimaryColor,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(12)
          )
      ),
    ),);
}

// Row(
// children: [
// Text(title),
// SizedBox(width: 10,),
// Expanded(
// child: TextFormField(
// validator: (String? value) =>  ValidatorClass.validateForm(value),
// cursorColor: kPrimaryColor,
// decoration: InputDecoration(
// contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
// border: OutlineInputBorder(
// borderRadius: BorderRadius.circular(12),
// ),
// focusedBorder: OutlineInputBorder(
// borderSide: BorderSide(color: kPrimaryColor),
// borderRadius: BorderRadius.circular(12)
// )
// ),
// ),
// ),
// ],
// )