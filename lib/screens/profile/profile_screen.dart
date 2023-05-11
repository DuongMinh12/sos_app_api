import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/models/models.dart';
import '../../cubit/account/customer_profile/user_pro5_cubit.dart';
import 'components/body_pro5_user.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);
  static String routeName = 'profilePage';

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserPro5Cubit>(context).getUserPro5();
  }

  @override
  Widget build(BuildContext context) {
    // final controller = Get.put(ProfileController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: BlocBuilder<UserPro5Cubit, UserPro5State>(
        builder: (context, state) {
          if (state is UserPro5Loading && state.isLoading == true) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is UserPro5Loaded) {
            if (state.user != null) {
              return BodyPro5User(
                avatar: (state.user.avatar!=null)? state.user.avatar.toString(): Customer.user.imageUrl!,
                  username: (state.user.name != null) ? state.user.name.toString() : 'Unknow',
                  email: (state.user.email != null) ? state.user.email.toString() : 'Unknow',
                  phoneNumer: (state.user.phoneNumber!=null)? '${state.user.phoneNumber.hashCode}' : 'xxx-xxx-xxxx');
            } else {
              return BodyPro5User(
                email: 'Unknow',
                username: 'Unknow',
                phoneNumer: 'xxx-xxx-xxxx',
                avatar: Customer.user.imageUrl!,
              );
            }
          } else {
            return BodyPro5User(
              email: 'Unknow',
              username: 'Unknow',
              phoneNumer: 'xxx-xxx-xxxx',
              avatar: Customer.user.imageUrl!,
            );
          }
        },
      ),
    );
  }
}

