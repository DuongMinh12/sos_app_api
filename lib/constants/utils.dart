import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
class Utils {
  static void fieldFocus(BuildContext context, FocusNode currentNode, FocusNode nextFocus){
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  static toassMessage(String message){
    Fluttertoast.showToast(msg: message, textColor: Colors.white, backgroundColor: Colors.black);
  }
}