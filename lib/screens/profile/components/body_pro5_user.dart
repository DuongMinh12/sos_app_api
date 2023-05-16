import 'package:flutter/material.dart';
import 'package:warning_app/cubit/account/customer_profile/user_pro5_cubit.dart';

import '../../../constants/add_all.dart';
import 'biologistID.dart';
import 'build_container_profile.dart';

class BodyPro5User extends StatelessWidget {
  BodyPro5User({
    required this.controllerName,
    required this.controllerEmail,
    required this.controllerPhone,
    required this.avatar,
    required this.updateButton,
    required this.email,
    required this.name,
    required this.updateAvatarGallery,
    required this.updateAvatarCamera,
    required this.deleteAcc,
    super.key,
  });
  TextEditingController controllerName;
  TextEditingController controllerEmail;
  TextEditingController controllerPhone;
  String avatar;
  VoidCallback updateButton;
  String name;
  String email;
  VoidCallback updateAvatarGallery;
  VoidCallback updateAvatarCamera;
  VoidCallback deleteAcc;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 20.0, bottom: 15),
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.grey,
                    radius: 50,
                    backgroundImage: NetworkImage(avatar),
                  ),
                  Positioned(
                      right: 5,
                      bottom: 0,
                      child: GestureDetector(
                        onTap: () {
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
                                      listTitleChoosePiture('Pick from Gallery', Icons.image, updateAvatarGallery),
                                      Divider(),
                                      listTitleChoosePiture('Pick from Camera', Icons.camera, updateAvatarCamera),
                                    ],
                                  ),
                                );
                              });
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          alignment: Alignment.center,
                          child: Icon(
                            Icons.add_a_photo_outlined,
                            color: Colors.white,
                            size: 19,
                          ),
                          decoration: BoxDecoration(color: kPrimaryColor, borderRadius: BorderRadius.circular(99)),
                        ),
                      )),
                ],
              )),
          Text(
            name,
            style: txt18!.copyWith(fontWeight: FontWeight.w700),
          ),
          SizedBox(
            height: 3,
          ),
          Text(
            email,
            style: txt16!.copyWith(fontWeight: FontWeight.normal),
          ),
          SizedBox(
            height: 20,
          ),
          buildProfile('User Name', Icons.person, controllerName, TextInputType.text),
          buildProfile('Email', Icons.mail_outline, controllerEmail, TextInputType.emailAddress),
          buildProfile('Phone Number', Icons.phone, controllerPhone, TextInputType.phone),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            onPressed: updateButton,
            child: Text('Edit Profile'),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(345, 40),
                backgroundColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
          ElevatedButton(
            onPressed: deleteAcc,
            child: Text('Delete Account'),
            style: ElevatedButton.styleFrom(
                minimumSize: Size(345, 40),
                backgroundColor: Colors.blueAccent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                )),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(color: kBackground.withAlpha(200), borderRadius: BorderRadius.circular(12)),
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.end,
              children: [
                BiologistID(
                  title: 'Thiết lập đăng nhập nhanh',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget listTitleChoosePiture(String title, IconData icon, VoidCallback ontap){
  return InkWell(
    onTap: ontap,
    child: ListTile(
      leading: CircleAvatar(
        backgroundColor: kBackground.withAlpha(100),
        child: Icon(icon, color: Colors.grey.shade800,),
      ),
      title: Text(title, style: txt18!.copyWith(fontWeight: FontWeight.w500),),
    ),
  );
}
