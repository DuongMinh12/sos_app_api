import 'package:flutter/material.dart';

import '../../widgets/widgets.dart';

class CloseSystem extends StatelessWidget {
  const CloseSystem({Key? key}) : super(key: key);
  static String routeName = 'closeSystem';
  @override
  Widget build(BuildContext context) {
    return BackGroundButtonWidget(
      routename: CloseSystem.routeName,
      title: 'Đóng Hệ Thống',
      child: ContainerIconWidget(
        type: 'donghethong',
        navigat: CloseSystem.routeName,
      ),
      type: 'donghethong',
    );
  }
}
