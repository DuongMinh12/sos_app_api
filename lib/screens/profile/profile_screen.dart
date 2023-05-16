import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:image_picker/image_picker.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/constants/utils.dart';
import 'package:warning_app/models/models.dart';
import '../../cubit/account/customer_profile/user_pro5_cubit.dart';
import 'components/body_pro5_user.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  static String routeName = 'profilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
}

class _ProfilePageState extends State<ProfilePage> {
  UserPro5Cubit userPro5Cubit = UserPro5Cubit();
  XFile? _imagePicker;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserPro5Cubit>(context).getUserPro5();
    widget.name.text;
    widget.email.text;
    widget.phone.text;
    // XFile? _imagePicker;
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            ZoomDrawer.of(context)!.open();
          },
          icon: Icon(
            Icons.menu,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: Center(
            child: Text(
          'Profile',
          style: txt20!.copyWith(fontWeight: FontWeight.w700),
        )),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: BlocBuilder<UserPro5Cubit, UserPro5State>(
            builder: (context, state) {
              if (state is UserPro5Loading && state.isLoading == true) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is UserPro5Loaded) {
                String image = local + state.user.avatar.toString();
                widget.name.text = state.user.name != null ? state.user.name.toString() : 'Unkown';
                widget.email.text = state.user.email != null ? state.user.email.toString() : 'Unkown';
                widget.phone.text = state.user.phoneNumber != null ? state.user.phoneNumber.toString() : 'xxx-xxx-xxxx';
                if (state.user != null) {
                  return BodyPro5User(
                    avatar: (state.user.avatar != null) ? image : Customer.user.imageUrl!,
                    name: (state.user.name != null) ? state.user.name.toString() : 'Unknow',
                    email: (state.user.email != null) ? state.user.email.toString() : 'Unknow',
                    controllerName: widget.name,
                    controllerEmail: widget.email,
                    controllerPhone: widget.phone,
                    // phoneNumer: (state.user.phoneNumber!=null)? '${state.user.phoneNumber.hashCode}' : 'xxx-xxx-xxxx',
                    updateButton: () {
                      userPro5Cubit.updateUserPro5(context, widget.name.text, widget.email.text, widget.phone.text);
                    },
                    updateAvatarGallery: () {
                      userPro5Cubit.updateAvatar(context, ImageSource.gallery);
                    },
                    updateAvatarCamera: () {
                      userPro5Cubit.updateAvatar(context, ImageSource.camera);
                    },
                    deleteAcc: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return buildAlertDialogDeleteAcc(state);
                          });
                      // userPro5Cubit.deleteAccount(context);
                    },
                  );
                } else {
                  return BodyPro5User(
                    email: 'Unknow',
                    name: 'Unknow',
                    controllerName: TextEditingController(text: 'Unknow'),
                    controllerEmail: TextEditingController(text: 'Unknow'),
                    controllerPhone: TextEditingController(text: 'xxx-xxx-xxxx'),
                    avatar: Customer.user.imageUrl!,
                    updateButton: () {
                      Utils.toassMessage('Service error');
                    },
                    updateAvatarGallery: () {},
                    updateAvatarCamera: () {},
                    deleteAcc: () {},
                  );
                }
              } else {
                return BodyPro5User(
                  email: 'Unknow',
                  name: 'Unknow',
                  controllerName: TextEditingController(text: 'Unknow'),
                  controllerEmail: TextEditingController(text: 'Unknow'),
                  controllerPhone: TextEditingController(text: 'xxx-xxx-xxxx'),
                  avatar: Customer.user.imageUrl!,
                  updateButton: () {
                    Utils.toassMessage('Service error');
                  },
                  updateAvatarGallery: () {},
                  updateAvatarCamera: () {},
                  deleteAcc: () {},
                );
              }
            },
          ),
        ),
      ),
    );
  }

  AlertDialog buildAlertDialogDeleteAcc(UserPro5Loaded state) {
    UserPro5Cubit userPro5Cubit = UserPro5Cubit();
    return AlertDialog(
      title: Text('Cảnh báo.'),
      contentPadding: EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 0),
      content: Text('Bạn đang xóa tài khoản ${state.user.name}.'
          ' Sau khi thực hiện toàn bộ dữ liệu của bạn sẽ bị xóa, bạn có chắc chắn muốn xóa tài khoản?'),
      actions: [
        TextButton(onPressed: (){
          Navigator.pop(context);
        }, child: Text('Cancel', style: txt15!.copyWith(color: Colors.blueAccent),)),
        TextButton(onPressed: (){
          userPro5Cubit.deleteAccount(context);
        }, child: Text('Delete',style: txt15!.copyWith(color: Colors.blueAccent))),
      ],
      actionsPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      actionsAlignment: MainAxisAlignment.spaceBetween,
    );
  }
  // void takePhoto() async{
  //   var pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if(pickedFile==null){
  //     return;
  //   }
  //
  //   setState(() {
  //     _imagePicker = pickedFile;
  //     userPro5Cubit.updateAvatar(File(_imagePicker!.path));
  //   });
  // }
}
