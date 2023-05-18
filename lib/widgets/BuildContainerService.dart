import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warning_app/cubit/service/list_service/list_service_cubit.dart';
import 'package:warning_app/repositories/service/delete_service_responsitory.dart';
import 'package:warning_app/repositories/service/update_service_responsitory.dart';
import 'package:warning_app/screens/screens.dart';

import '../constants/add_all.dart';
import '../screens/profile/components/body_pro5_user.dart';
import '../validator/validator.dart';
import 'widgets.dart';

// Widget buildContainerService(BuildContext context, String serviceName, String rouname) {
//   final GlobalKey<FormState> _key = GlobalKey<FormState>();
//   TextEditingController nameService = TextEditingController();
//   TextEditingController linkOn = TextEditingController();
//   TextEditingController linkOff = TextEditingController();
//   DeleteServiceResponsitory deleteServiceResponsitory = DeleteServiceResponsitory();
//   return
// }

class buildContainerService extends StatefulWidget {
  buildContainerService({
    Key? key,
    required this.serviceName,
    required this.rouname,
    required this.textNameService,
    required this.linkOn,
    required this.linkOff,
    required this.idService,
  }) : super(key: key);

  @override
  State<buildContainerService> createState() => _buildContainerServiceState();
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController textNameService;
  TextEditingController linkOn;
  TextEditingController linkOff;
  DeleteServiceResponsitory deleteServiceResponsitory = DeleteServiceResponsitory();
  String serviceName;
  String rouname;
  UpdateServiceResponsitory updateServiceResponsitory = UpdateServiceResponsitory();
  var image;
  var imageName;
  String idService;
}

class _buildContainerServiceState extends State<buildContainerService> {
  @override
  void initState() {
    super.initState();
    widget.imageName;
    widget.image;
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          listTitleChoosePiture("Đóng/mở service.", Icons.change_circle_outlined, () {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) {
                  return BuildAlerdialogChangeState(
                    routename: widget.rouname,
                    serviceName: widget.serviceName,
                  );
                });
          }),
          Divider(),

          ///Sửa service
          listTitleChoosePiture("Chỉnh sửa service.", Icons.reply_all, () {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) {
                  return alertDialogUpdateService(context);
                });
          }),
          Divider(),

          ///Delete service
          listTitleChoosePiture("Delete service", Icons.delete, () {
            Navigator.pop(context);
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Cảnh báo.'),
                    content: RichText(
                        textAlign: TextAlign.justify,
                        text: TextSpan(text: 'Bạn đang xóa ', style: TextStyle(color: Colors.black, fontSize: 15), children: [
                          TextSpan(text: widget.serviceName, style: TextStyle(color: Colors.blueAccent)),
                          TextSpan(text: ', mọi thông tin liên quan sẽ bị xóa, bạn có chắc muốn thực hiện thao tác?'),
                        ])),
                    actions: [
                      TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: Text('Cancel')),
                      TextButton(
                          onPressed: () async {
                            await widget.deleteServiceResponsitory.deleteService();
                            Navigator.pushNamed(context, widget.rouname);
                          },
                          child: Text('Delete'))
                    ],
                    actionsAlignment: MainAxisAlignment.spaceBetween,
                  );
                });
          }),
        ],
      ),
    );
  }

  AlertDialog alertDialogUpdateService(BuildContext context) {
    return AlertDialog(
      titleTextStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
      title: Text(
        'Vui lòng điền thông tin: ',
      ),
      content: Container(
        // height: 220,
        width: 300,
        child: Form(
          key: widget._key,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              FormInfor('Name:  ', (String? value) => ValidatorClass.validateFormName(value), widget.textNameService),
              FormInfor('Link on:', (String? value) => ValidatorClass.validateFormLink(value), widget.linkOn),
              FormInfor('Link off:', (String? value) => ValidatorClass.validateFormLink(value), widget.linkOff),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 0),
                leading: Text(
                  'Icon avatar:',
                  style: TextStyle(fontSize: 15),
                ),
                title: ElevatedButton(
                  onPressed: () {
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
                                listTitleChoosePiture('Pick from Gallery', Icons.image, () async {
                                  widget.image = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  Navigator.pop(context);
                                }),
                                Divider(),
                                listTitleChoosePiture('Pick from Camera', Icons.camera, () async {
                                  widget.image = await ImagePicker().pickImage(source: ImageSource.camera);
                                  print(widget.image);
                                 Navigator.pop(context);
                                }),
                              ],
                            ),
                          );
                        });
                  },
                  child: Text('Upload image'),
                  style: ElevatedButton.styleFrom(backgroundColor: kPrimaryColor),
                ),
                subtitle: Text(
                  widget.image != null ? 'Bạn đã thêm hình ảnh' : '',
                  style: TextStyle(fontSize: 13, color: kPrimaryColor),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Cancel', style: TextStyle(color: kPrimaryColor, fontSize: 16)),
        ),
        TextButton(
          onPressed: () async{
            await widget.updateServiceResponsitory.putUpdateService(widget.textNameService.text,
                widget.linkOn.text,
                widget.linkOff.text,
                widget.image,
                widget.idService,
            );
            // print(widget.textNameService.text);
            // print(widget.linkOff.text);
            // print(widget.linkOn.text);
            Navigator.pushNamed(context, widget.rouname);
          },
          child: Text('Submit', style: TextStyle(color: kPrimaryColor, fontSize: 16)),
        )
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}
