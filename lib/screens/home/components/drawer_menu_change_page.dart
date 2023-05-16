import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:warning_app/constants/add_all.dart';
import 'package:warning_app/models/menu_item_model.dart';
import 'package:warning_app/models/models.dart';
import 'package:warning_app/screens/screens.dart';

import '../../../app_state/app_state.dart';
import '../../../cubit/account/customer_profile/user_pro5_cubit.dart';

class MenuBody extends StatefulWidget {
  MenuBody({Key? key, required this.onSelectItem, required this.currentItem}) : super(key: key);
  final ValueChanged<MenuItem> onSelectItem;
  final MenuItem currentItem;

  @override
  State<MenuBody> createState() => _MenuBodyState();
}

class _MenuBodyState extends State<MenuBody> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<UserPro5Cubit>(context).getUserPro5();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: SafeArea(
        child: Container(
          height: double.infinity,
          padding: EdgeInsets.only(top: 40, ),
          color: kMainColor, //Colors.blueAccent.shade400,
          child: Column(
            children: [
              BlocBuilder<UserPro5Cubit, UserPro5State>(builder: (context, state){
                if(state is UserPro5Loading && state.isLoading==true){
                  return Center(child: CircularProgressIndicator(),);
                }
                if(state is UserPro5Loaded){
                  String image = local +state.user.avatar.toString();
                  if(state.user!= null){
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage((state.user.avatar != null) ? image : Customer.user.imageUrl!),
                          backgroundColor: Colors.white24,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          (state.user.name != null) ? state.user.name.toString(): 'Unknow',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          (state.user.email != null) ? state.user.email.toString(): 'Unknow',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    );
                  }
                  else{
                    return Column(
                      children: [
                        CircleAvatar(
                          radius: 35,
                          backgroundImage: NetworkImage(Customer.user.imageUrl!),
                          backgroundColor: Colors.white24,
                        ),
                        SizedBox(height: 10,),
                        Text(
                          'Unknow',
                          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.white),
                        ),
                        SizedBox(height: 5,),
                        Text(
                          'Unknow',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                      ],
                    );
                  }
                }
                else{
                  return Center(child: Text('Some thing went wrong', style: TextStyle(fontSize: 16, color: Colors.white),),);
                }
              }),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, top: 5),
                child: Divider(thickness: 1.2,),
              ),
              ...MenuItems.all.map(buildMenuItem).toList(),
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Divider(),
              ),
              ListTile(
                minLeadingWidth: 20,
                leading: Icon(Icons.logout),
                title: Text('Log Out'),
                onTap: (){
                  AppState.instance.settingBox.remove(SettingType.accessToken.toString());
                  Navigator.pushNamed(context, LogInPage.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

   buildMenuItem (MenuItem item) => ListTile(
    minLeadingWidth: 20,
    selected: widget.currentItem == item,
    leading: Icon(item.iconData),
     title: Text(item.nameitem,),
     onTap: () => widget.onSelectItem(item),
  );
}