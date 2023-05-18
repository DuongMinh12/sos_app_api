import 'package:flutter/material.dart';

import '../app_state/app_state.dart';
import '../cubit/service/list_service/list_service_cubit.dart';
import '../repositories/service/change_state_service_responsitory.dart';
import '../repositories/service/otp_Cstate_responsitory.dart';

class BuildAlerdialogChangeState extends StatefulWidget {
  BuildAlerdialogChangeState({Key? key, required this.serviceName, required this.routename}) : super(key: key);

  @override
  State<BuildAlerdialogChangeState> createState() => _BuildAlerdialogChangeStateState();
  OtpChangeStateResponsitory otpChangeStateResponsitory = OtpChangeStateResponsitory();
  ChangeStateServiceResponsitory changeStateResponsitory = ChangeStateServiceResponsitory();
  TextEditingController otp = TextEditingController();
  StateModel stateModel = StateModel();
  var idService = AppState.instance.settingBox.read(SettingType.idService.toString());
  String serviceName;
  String routename;
}

class _BuildAlerdialogChangeStateState extends State<BuildAlerdialogChangeState> {
  bool chewck = false;
  @override
  void initState() {
    super.initState();
    widget.otp;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.only(bottom: 0, left: 20, right: 20, top: 10),
      title: Text('Cảnh báo.'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          RichText(
              textAlign: TextAlign.justify,
              text: TextSpan(text: 'Bạn đang thay đổi trạng thái của ', style: TextStyle(color: Colors.black, fontSize: 15), children: [
                TextSpan(text: widget.serviceName, style: TextStyle(color: Colors.blueAccent)),
                TextSpan(text: '. Nếu bạn chắc chắn muốn thực hiện thao tác, vui lòng nhập otp bên dưới.')
              ])),
          // Text('Bạn đang thay đổi trạng thái của ${widget.serviceName}, nếu bạn chắc chắn muốn thực hiện thao tác, vui lòng nhập otp bên dưới.'),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: widget.otp,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(
                hintText: 'Nhập otp.',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                suffixIconConstraints: BoxConstraints(
                  maxWidth: 90,
                ),
                suffixIcon: IntrinsicHeight(
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 0),
                        child: VerticalDivider(
                          thickness: 1,
                          width: 0,
                        ),
                      ),
                      TextButton(
                        child: Text('Send code'),
                        onPressed: () {
                          widget.otpChangeStateResponsitory.getotpState();
                        },
                      ),
                    ],
                  ),
                ),
                contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 15),
                border: OutlineInputBorder()),
          )
        ],
      ),
      actionsAlignment: MainAxisAlignment.spaceBetween,
      actions: [
        TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel')),
        ElevatedButton(
            onPressed: () async {
              await widget.changeStateResponsitory.putChangeState(widget.idService, widget.otp.text);
              Navigator.pushNamed(context, widget.routename);
            }
            // changeStateResponsitory.putChangeState(inService, otp.text);
            // widget.listServiceCubit.changeStateService(id, otp);
            ,
            child: Text('Submit code')),
      ],
    );
  }
}

class StateModel {
  bool? icheck;
  StateModel({this.icheck});
}
