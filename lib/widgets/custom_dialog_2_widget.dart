import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:warning_app/models/models.dart';
import 'package:warning_app/screens/screens.dart';

import '../constants/add_all.dart';

class CustomAlertDialogChild extends StatelessWidget {
   const CustomAlertDialogChild({Key? key,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //bool testchange;
    ChangeStateModel changeStateModel =  ChangeStateModel();
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
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Warning!!!', style: txt20!),
                SizedBox(height: 20,),
                Text('Bạn đang đóng element, bạn có chắc rằng muốn đóng element?', style: txt18!.copyWith(fontWeight: FontWeight.normal),),
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
                            changeStateModel.changestatebutton = false;
                            //testchange = false;
                          },
                          child: Text('Cancel'),
                          style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
                          ),
                        )),
                    Container(
                        width: 100,
                        child: ElevatedButton(
                          onPressed: (){
                            Navigator.pop(context);
                            //testchange = true;
                            changeStateModel.changestatebutton = true;
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
                        Colors.orange.shade400,
                        Colors.orange.shade100,
                      ]
                  ),
                 //color: Colors.white,
                  borderRadius: BorderRadius.circular(99)),
              child: Lottie.network('https://assets9.lottiefiles.com/packages/lf20_UxVUy6KZG1.json'),
            ),
          )
        ],
      ),
    );
  }
}