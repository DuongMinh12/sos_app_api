import 'package:flutter/material.dart';

import 'package:warning_app/repositories/service/delete_service_responsitory.dart';
import 'package:warning_app/repositories/service/update_service_responsitory.dart';

import '../screens/profile/components/body_pro5_user.dart';
import 'widgets.dart';

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
  TextEditingController textNameService;
  TextEditingController linkOn;
  TextEditingController linkOff;
  DeleteServiceResponsitory deleteServiceResponsitory = DeleteServiceResponsitory();
  String serviceName;
  String rouname;
  UpdateServiceResponsitory updateServiceResponsitory = UpdateServiceResponsitory();
  String idService;
}

class _buildContainerServiceState extends State<buildContainerService> {
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
                  return AlertDialogUpdate(
                    textNameService: widget.textNameService,
                    linkOff: widget.linkOff,
                    linkOn: widget.linkOn,
                    idService: widget.idService,
                    routename: widget.rouname,
                  );
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
}
