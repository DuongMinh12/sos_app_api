import 'package:flutter/material.dart';

import '../constants/add_all.dart';

class CustomAppbar extends StatelessWidget with PreferredSizeWidget {
  final String title;
  const CustomAppbar({
    Key? key, required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kMainColor,
      title: Text(title, style: titlestyle,),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}