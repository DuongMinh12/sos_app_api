import 'package:flutter/material.dart';

import '../constants/add_all.dart';

class BuildText extends StatelessWidget {
  final String txttext;
  const BuildText({
    Key? key, required this.txttext,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(txttext, style: txt18,);
  }
}