import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/add_all.dart';
import '../cubit/service/update_service/update_service_cubit.dart';
import '../screens/profile/components/body_pro5_user.dart';
import '../validator/validator.dart';
import 'buildDialog.dart';

final GlobalKey<FormState> _key = GlobalKey<FormState>();

class AlertDialogUpdate extends StatefulWidget {
  AlertDialogUpdate({
    required this.textNameService,
    required this.linkOn,
    required this.linkOff,
    required this.idService,
    required this.routename,
    super.key,
  });
  @override
  State<AlertDialogUpdate> createState() => _AlertDialogUpdateState();
  TextEditingController textNameService;
  TextEditingController linkOn;
  TextEditingController linkOff;
  UpdateServiceCubit updateServiceCubit = UpdateServiceCubit();
  String idService;
  String routename;
}

class _AlertDialogUpdateState extends State<AlertDialogUpdate> {
  var image;
  var imageName;
  @override
  void initState() {
    super.initState();
    widget.updateServiceCubit = BlocProvider.of<UpdateServiceCubit>(context);
  }

  @override
  Widget build(BuildContext context) {
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
                                  Navigator.pop(context);
                                  final pick = await ImagePicker().pickImage(source: ImageSource.gallery);
                                  imageName = pick!.path.split('/').last;
                                  setState(() {
                                    image = pick;
                                  });
                                }),
                                Divider(),
                                listTitleChoosePiture('Pick from Camera', Icons.camera, () async {
                                  Navigator.pop(context);
                                  final pick = await ImagePicker().pickImage(source: ImageSource.camera);
                                  imageName = pick!.path.split('/').last;
                                  setState(() {
                                    image = pick;
                                  });
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
                  imageName != null ? imageName : '',
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
        BlocBuilder<UpdateServiceCubit, UpdateServiceState>(builder: (context, state) {
          if (state is UpdateServiceLoading && state.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return TextButton(
            onPressed: () async {
              await widget.updateServiceCubit.updateService(widget.textNameService.text, widget.linkOn.text, widget.linkOff.text, image, widget.idService);
              Navigator.pushNamed(context, widget.routename);
            },
            child: Text('Submit', style: TextStyle(color: kPrimaryColor, fontSize: 16)),
          );
        }),
      ],
      actionsAlignment: MainAxisAlignment.spaceBetween,
      contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      actionsPadding: EdgeInsets.symmetric(horizontal: 10),
    );
  }
}