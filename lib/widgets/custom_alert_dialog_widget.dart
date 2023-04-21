import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/widgets/widgets.dart';

class CustomAlertDialog extends StatelessWidget {
  CustomAlertDialog({Key? key, }) : super(key: key);
  TextEditingController txt = TextEditingController();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  @override
  String? validatorcheck(String? validatorerror){
    if(validatorerror!.isEmpty){
      return 'Bạn chưa nhập mật khẩu';
    }
    else if(validatorerror != 'admin'){
      return 'Mật khẩu bạn nhập không đúng';
    }
    else{return null;}
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.topCenter,
        children: [
          Container(
            height: 240,
            width: double.infinity,
            padding: EdgeInsets.only(top: 50, bottom: 16, left: 16, right: 16),
            margin: EdgeInsets.only(
              top: 40,
            ),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20)),
            child: Form(
              key: _key,
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Vui lòng nhập mật khẩu', style: txt16!.copyWith(fontWeight: FontWeight.normal),),
                  SizedBox(height: 20,),
                  TextFormField(
                    validator: validatorcheck,
                    controller: txt,
                    decoration: InputDecoration(hintText: 'Nhập password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8)
                    ),),
                  ),
                  //SizedBox(height: 10,),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Cancel'),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                            ),
                          )),
                      Container(
                          width: 100,
                          child: ElevatedButton(
                            onPressed: () {
                              if(_key.currentState!.validate() && txt.text =='admin'){
                                Navigator.pop(context);
                                  showDialog(context: context, builder: (context){
                                    return CustomAlertDialogChild();
                                  });
                              }
                            },
                            child: Text('Ok'),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                              backgroundColor: Colors.red
                            ),
                          )),
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            //top: 10,
            //left: 100,
            child: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentDirectional.topStart,
                    colors: [
                      Colors.orange.shade600,
                      Colors.orange.shade300,
                    ]
                  ),
                  borderRadius: BorderRadius.circular(99)),
              child: Lottie.asset(alerticon),
            ),
          )
        ],
      ),
    );
  }
}
