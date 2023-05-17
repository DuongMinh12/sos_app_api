import 'package:flutter/material.dart';
import 'package:warning_app/cubit/service/list_service/list_service_cubit.dart';
import 'package:warning_app/repositories/delete_service_responsitory.dart';
import 'package:warning_app/screens/screens.dart';

import '../constants/add_all.dart';
import '../screens/profile/components/body_pro5_user.dart';
import '../validator/validator.dart';
import 'widgets.dart';

Widget buildContainerService(BuildContext context, String serviceName, String rouname) {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  TextEditingController nameService = TextEditingController();
  TextEditingController linkOn = TextEditingController();
  TextEditingController linkOff = TextEditingController();
  DeleteServiceResponsitory deleteServiceResponsitory = DeleteServiceResponsitory();
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
                  serviceName: serviceName,
                );
              });
        }),
        Divider(),
        listTitleChoosePiture("Chỉnh sửa service.", Icons.reply_all, () {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  titleTextStyle: TextStyle(fontSize: 16, color: Colors.black, fontWeight: FontWeight.w500),
                  title: Text(
                    'Vui lòng điền thông tin: ',
                  ),
                  content: Container(
                    // height: 220,
                    width: 300,
                    child: Form(
                      key: _key,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          FormInfor('Name:  ', (String? value) => ValidatorClass.validateFormName(value), nameService),
                          FormInfor('Link on:', (String? value) => ValidatorClass.validateFormLink(value), linkOn),
                          FormInfor('Link off:', (String? value) => ValidatorClass.validateFormLink(value), linkOff),
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
                                              Navigator.pop(context);
                                            }),
                                            Divider(),
                                            listTitleChoosePiture('Pick from Camera', Icons.camera, () async {
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
                          )
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
                      onPressed: () {},
                      child: Text('Submit', style: TextStyle(color: kPrimaryColor, fontSize: 16)),
                    )
                  ],
                  actionsAlignment: MainAxisAlignment.spaceBetween,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  actionsPadding: EdgeInsets.symmetric(horizontal: 10),
                );
              });
        }),
        Divider(),
        listTitleChoosePiture("Delete service", Icons.delete, () {
          Navigator.pop(context);
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  title: Text('Cảnh báo.'),
                  content:  RichText(
                      textAlign: TextAlign.justify,
                      text: TextSpan(text: 'Bạn đang xóa ', style: TextStyle(color: Colors.black, fontSize: 15), children: [
                        TextSpan(text: serviceName, style: TextStyle(color: Colors.blueAccent)),
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
                          await deleteServiceResponsitory.deleteService();
                          Navigator.pushNamed(context, rouname);
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
