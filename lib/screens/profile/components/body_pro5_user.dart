import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';
import 'biologistID.dart';
import 'build_container_profile.dart';

class BodyPro5User extends StatelessWidget {
  BodyPro5User({
    required this.username,
    required this.email,
    required this.phoneNumer,
    required this.avatar,
    super.key,
  });
  String username;
  String email;
  String phoneNumer;
  String avatar;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
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
                            print('ok');
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
              username,
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
            buildProfile('User Name', Icons.person, username),
            buildProfile('Email', Icons.mail_outline, email),
            buildProfile('Phone Number', Icons.phone, phoneNumer),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                print('Save');
              },
              child: Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                  minimumSize: Size(345, 40),
                  backgroundColor: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
            ),
            ElevatedButton(
              onPressed: () {
                print('Deleted');
              },
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
      ),
    );
  }
}