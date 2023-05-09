import 'package:flutter/material.dart';

import '../../../constants/add_all.dart';

class ContainerButton extends StatelessWidget {
   ContainerButton({
    super.key, required this.title, required this.icon, required this.ontap,
  });
  final String title;
  final String icon;
  final VoidCallback ontap;
  bool isC = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        // margin: EdgeInsets.all(8),
        height: 200,
        width: 170,
        decoration: BoxDecoration(
          color: isC == false? kPrimaryColor.withAlpha(60) : Colors.red,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 65,
              width: 65,
              child: Image.asset(icon),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: txt16,
            )
          ],
        ),
      ),
    );
  }
}