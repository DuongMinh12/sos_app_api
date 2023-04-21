import 'package:flutter/material.dart';
import 'package:warning_app/constants/add_all.dart';

import '../../../animation/fade_animation.dart';

class loginIconButton extends StatelessWidget {
  const loginIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FadeAnimation(
        2,
        Column(
          children: [
            Text(
              'Or',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, fontFamily: 'Alkatra', color: Colors.deepPurpleAccent.shade200),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30.0),
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildElevatedButton('Facebook', facebookicon, Colors.blue, Colors.blue.shade200 ),
                  Container(
                      height: 35,
                      margin: EdgeInsets.symmetric(horizontal: 5),
                      child: VerticalDivider(
                        thickness: 2,
                      )),
                  buildElevatedButton('Gmail' ,gmailicon, Colors.deepOrange, Colors.deepOrange.shade200 ),
                ],
              ),
            )
          ],
        ));
  }

  buildElevatedButton(String title, String icon, Color co1, Color co2) => Expanded(
    child: GestureDetector(
      child: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(icon),
              margin: EdgeInsets.symmetric(vertical: 5, horizontal: 8),
            ),
            Text(
              title,
              style: txt14!.copyWith(color: Colors.white, fontWeight: FontWeight.w500),
            ),
          ],
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            co1,
            //Colors.blue.shade300,
            co2
          ]),
          borderRadius: BorderRadius.circular(10),
        ),
        height: 40,
        alignment: Alignment.center,
      ),
      onTap: () {
        //buildShowDialog(context, 'Facebook log in', 'You have already log in with Facebook');
      },
    ),
  );
}
