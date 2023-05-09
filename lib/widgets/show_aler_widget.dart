import 'package:flutter/material.dart';

import '../validator/validator.dart';

class ShowAler extends StatefulWidget {
  ShowAler({Key? key, required this.title}) : super(key: key);

  @override
  State<ShowAler> createState() => _ShowAlerState();
  String title;
  var pw;
}

class _ShowAlerState extends State<ShowAler> {
  @override
  @override
  void initState() {
    super.initState();
    widget.pw = TextEditingController();
  }


  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Vui lòng nhập mật khẩu'),
      content: Form(
        key: _key,
        child: TextFormField(
          controller: widget.pw,
          validator: (String? value) => ValidatorClass.validatePassword(value),
          decoration: InputDecoration(
              hintText: 'Nhập mật khẩu của bạn',
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12)
              )
          ),
        ),
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel')),
        TextButton(onPressed: (){
          if(_key.currentState!.validate() && widget.pw.text == '123456'){
            Navigator.pop(context);
            showDialog(context: context, builder: (context){
              return showaler2(context, widget.title);
            });
          }}, child: Text('Ok')),
      ],
    );
  }
}

AlertDialog showaler2(BuildContext context, String title){
  return AlertDialog(
    actionsAlignment: MainAxisAlignment.spaceBetween,
    title: Text('Bạn đang $title'),
    content: Text('Bạn đang $title, thực hiện thao tác này có thể gây ảnh hưởng đến thao tác trong app, bạn có chắc muốn $title\?'),
    actions: [
      TextButton(onPressed: (){Navigator.pop(context);}, child: Text('Cancel')),
      TextButton(onPressed: (){}, child: Text('Ok')),
    ],
  );
}