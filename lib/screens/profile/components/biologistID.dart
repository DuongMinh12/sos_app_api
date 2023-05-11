import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:warning_app/constants/add_all.dart';

import '../../../app_state/app_state.dart';

class BiologistID extends StatefulWidget {
  BiologistID({Key? key, required this.title,}) : super(key: key);

  @override
  State<BiologistID> createState() => _BiologistIDState();
  final String title;
}

class _BiologistIDState extends State<BiologistID> {
  bool ischange = false;

  void changestate (bool value){
    setState(() {
      ischange = value;
      AppState.instance.settingBox.write(SettingType.biometricState.toString(), ischange);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(widget.title, style: TextStyle(fontSize: 15),),
        SizedBox(width: 10,),
        CupertinoSwitch(value: AppState.instance.settingBox.read(SettingType.biometricState.toString()) == null? ischange : AppState.instance.settingBox.read(SettingType.biometricState.toString()), onChanged: changestate, activeColor: kPrimaryColor,),
      ],
    );
  }
}