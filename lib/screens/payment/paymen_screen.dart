import 'package:flutter/material.dart';

import '../../constants/add_all.dart';
import '../../widgets/widgets.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({Key? key}) : super(key: key);
  static String routeName = 'PaymentScreen';
  @override
  Widget build(BuildContext context) {
    return BackGroundButtonWidget(
      title: 'Khóa Rút Tiền',
      child: ContainerIconWidget(),
    );
  }
}
