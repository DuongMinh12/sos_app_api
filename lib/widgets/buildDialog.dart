import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warning_app/cubit/account/customer_profile/user_pro5_cubit.dart';
import 'package:warning_app/cubit/service/add_service/add_service_cubit.dart';
import 'package:warning_app/repositories/customer/update_avatar_responsitory.dart';
import 'package:warning_app/validator/validator.dart';
import 'package:http_parser/http_parser.dart';

import '../constants/add_all.dart';
import '../screens/profile/components/body_pro5_user.dart';

final GlobalKey<FormState> _key = GlobalKey<FormState>();


class BuilAlerDialog extends StatefulWidget {
  BuilAlerDialog({Key? key,required this.type, required this.routename }) : super(key: key);

  @override
  State<BuilAlerDialog> createState() => _BuilAlerDialogState();
  String type;
  AddServiceCubit addServiceCubit = AddServiceCubit();
  TextEditingController nameService = TextEditingController();
  TextEditingController linkOn = TextEditingController();
  TextEditingController linkOff = TextEditingController();
  UpdateAvatarRsponsitory avatarRsponsitory = UpdateAvatarRsponsitory();
  String routename;
}

class _BuilAlerDialogState extends State<BuilAlerDialog> {
  var image;
  @override
  void initState() {
    super.initState();
    widget.addServiceCubit = BlocProvider.of<AddServiceCubit>(context);
    widget.nameService;
    widget.linkOff;
    widget.linkOn;
  }
  @override
  Widget build(BuildContext context) {
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
              FormInfor('Name:  ', (String? value) => ValidatorClass.validateFormName(value), widget.nameService),
              FormInfor('Link on:', (String? value) => ValidatorClass.validateFormLink(value), widget.linkOn),
              FormInfor('Link off:', (String? value) => ValidatorClass.validateFormLink(value), widget.linkOff),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: Text('Icon avatar:', style: TextStyle(fontSize: 15),),
                title: ElevatedButton(onPressed: (){
                  showModalBottomSheet(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
                      ),
                      backgroundColor: Colors.white,
                      context: context,
                      builder: (context) {
                        return Container(
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                          height: 200,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              listTitleChoosePiture('Pick from Gallery', Icons.image, () async{
                                final pickerFile = await ImagePicker().pickImage(source: ImageSource.gallery);
                                setState(() {
                                  image = pickerFile;
                                });
                                Navigator.pop(context);
                                // image = takePhoto(ImageSource.gallery);
                                // widget.avatarRsponsitory.getAvatar(context, ImageSource.gallery);
                              }),
                              Divider(),
                              listTitleChoosePiture('Pick from Camera', Icons.camera, () async{
                                final pickerFile = await ImagePicker().pickImage(source: ImageSource.camera);
                                setState(() {
                                  image = pickerFile;
                                });
                                Navigator.pop(context);
                               // image = takePhoto(ImageSource.camera);
                                // widget.avatarRsponsitory.getAvatar(context, ImageSource.camera);
                              }),
                            ],
                          ),
                        );
                      });
                }, child: Text('Upload image'),
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
        BlocBuilder<AddServiceCubit, AddServiceState>(
          builder: (context, state){
            if(state is AddServiceLoading && state.isLoading == true){
              return Center(child: CircularProgressIndicator(),);
            }
            return TextButton(
              onPressed: (){
                if(_key.currentState!.validate()){
                  widget.addServiceCubit.addServiceIcon(context, widget.nameService.text, widget.linkOn.text, widget.linkOff.text, widget.type, image);
                  Navigator.pushNamed(context, widget.routename);
                }
              },
              child: Text('Submit', style: TextStyle(color: kPrimaryColor, fontSize: 16)),
            );
          },
        ),
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}

FormInfor (String title, String? Function(String?)? validator, TextEditingController controller){
  return ListTile(
    // minVerticalPadding: 0,
    // minLeadingWidth: 20,
    contentPadding: EdgeInsets.symmetric(horizontal: 0),
    leading: Text(title, style: TextStyle(fontSize: 15),),
    title: TextFormField(
      controller: controller,
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

// Future <XFile?> takePhoto (ImageSource source) async{
//   final pickerFile = await ImagePicker().pickImage(source: source);
//   if (pickerFile == null) {
//     return null;
//   }
//   return pickerFile;
// }