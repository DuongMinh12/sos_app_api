import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:password_strength_checker/password_strength_checker.dart';

import '../../../constants/add_all.dart';

class BuildTextFormFile extends StatefulWidget {
  Widget? prefixIcon;
  //Widget?
  final TextEditingController controller;
  BuildTextFormFile({super.key, required this.controller, this.prefixIcon, required this.title, required this.validator, required this.isPass, this.onchange,});
  final String title;
  String? Function(String?)? validator;
  final bool isPass;
  void Function(String)? onchange;

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
        onChanged: widget.onchange,
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
