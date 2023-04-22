import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

import '../../../constants/add_all.dart';

class PinPutWidget extends StatefulWidget {
  PinPutWidget({
    super.key, required this.pinputController
  });
  TextEditingController pinputController = TextEditingController();
  @override
  State<PinPutWidget> createState() => _PinPutWidgetState();
}

class _PinPutWidgetState extends State<PinPutWidget> {
  @override
  void initState() {
    super.initState();
    widget.pinputController;
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    widget.pinputController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0, bottom: 20),
      child: Pinput(
        controller:  widget.pinputController,
        length: 6,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        defaultPinTheme: PinTheme(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            border: Border.all(color: kPrimaryColor),
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        focusedPinTheme: PinTheme(
            height: 55,
            width: 56,
            decoration: BoxDecoration(
              border: Border.all(color: kPrimaryColor),
              borderRadius: BorderRadius.circular(12),
            )
        ),
        submittedPinTheme: PinTheme(
            height: 50,
            width: 50,
            textStyle:  TextStyle(
                fontSize: 16,
                color: Colors.white
            ),
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            )
        ),
      ),
    );
  }
}