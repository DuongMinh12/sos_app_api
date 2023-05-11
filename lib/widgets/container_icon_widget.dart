import 'package:flutter/material.dart';

import '../constants/add_all.dart';

class ContainerIconWidget extends StatelessWidget {
  const ContainerIconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        ///Container bự bên ngoài
        alignment: AlignmentDirectional.topStart,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration:
        BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(30), boxShadow: [BoxShadow(color: kPrimaryColor.withAlpha(20), spreadRadius: 5, blurRadius: 7)]),
      ),
    );
  }
}