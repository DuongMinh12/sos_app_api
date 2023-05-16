import 'package:flutter/material.dart';

import '../app_state/app_state.dart';
import '../repositories/change_state_service_responsitory.dart';
import '../repositories/otp_Cstate_responsitory.dart';

class BuildAlerdialogChangeState extends StatefulWidget {
  BuildAlerdialogChangeState({Key? key}) : super(key: key);

  @override
  State<BuildAlerdialogChangeState> createState() => _BuildAlerdialogChangeStateState();
  OtpChangeStateResponsitory otpChangeStateResponsitory = OtpChangeStateResponsitory();
  ChangeStateServiceResponsitory changeStateResponsitory = ChangeStateServiceResponsitory();
  TextEditingController otp = TextEditingController();
  StateModel stateModel = StateModel();
  var idService = AppState.instance.settingBox.read(SettingType.idService.toString());
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
          Text('Bạn đang thay đổi trạng thái của ${''}, nếu bạn chắc chắn muốn thực hiện thao tác, vui lòng nhập otp bên dưới.'),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            controller: widget.otp,
            decoration: InputDecoration(
                hintText: 'Nhập otp.',
                hintStyle: TextStyle(color: Colors.grey.shade400),
                suffixIconConstraints: BoxConstraints(
                  maxWidth: 85,
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
            onPressed: () async{
              await widget.changeStateResponsitory.putChangeState(widget.idService, widget.otp.text);
              Navigator.pop(context);
            }
            // changeStateResponsitory.putChangeState(inService, otp.text);
            // widget.listServiceCubit.changeStateService(id, otp);
            ,
            child: Text('Submit code')),
      ],
    );
  }
}


class StateModel{
  bool? icheck;
  StateModel({this.icheck});
}