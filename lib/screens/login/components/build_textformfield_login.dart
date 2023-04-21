import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';

class BuildTextFormFile extends StatefulWidget {
  Widget? prefixIcon;
  //Widget?
  final TextEditingController controller;
  BuildTextFormFile({super.key, required this.controller, this.prefixIcon, required this.title, required this.validator, required this.isPass});
  final String title;
  String? Function(String?)? validator;
  final bool isPass;


  @override
  State<BuildTextFormFile> createState() => _BuildTextFormFileState();
}

class _BuildTextFormFileState extends State<BuildTextFormFile> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 45, vertical: 5),
      child: TextFormField(
        obscureText: (widget.isPass == true)? obscureText : false,
        validator: widget.validator,
        controller: widget.controller,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10),
            filled: true,
            fillColor: kPrimaryColor.withAlpha(50),
            prefixIcon: widget.prefixIcon,
            hintText: widget.title,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            ),
            suffixIcon: (widget.isPass == true)? IconButton(onPressed: (){
              setState(() {
                obscureText = !obscureText;
              });
            },icon: (obscureText == false) ? Icon(CupertinoIcons.eye): Icon(CupertinoIcons.eye_slash),): Icon(CupertinoIcons.eye, color: Colors.transparent,),
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: kPrimaryColor)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(30), borderSide: BorderSide(color: Colors.transparent))),
      ),
    );
  }
}
