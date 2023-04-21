import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BiologistID extends StatefulWidget {
  BiologistID({Key? key, required this.onChanged, required this.power, required this.title,}) : super(key: key);

  @override
  State<BiologistID> createState() => _BiologistIDState();
  void Function(bool)? onChanged;
  final bool power;
  final String title;
}

class _BiologistIDState extends State<BiologistID> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(widget.title),
        SizedBox(width: 10,),
        CupertinoSwitch(value: widget.power, onChanged: widget.onChanged),
      ],
    );
  }
}