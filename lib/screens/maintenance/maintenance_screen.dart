import 'package:flutter/material.dart';
import 'package:warning_app/widgets/widgets.dart';

class MaintenanceScreen extends StatelessWidget {
  const MaintenanceScreen({Key? key}) : super(key: key);
static String routeName = 'maintenanceScreen';
  @override
  Widget build(BuildContext context) {
    return BackGroundButtonWidget(
        child: ContainerIconWidget(), title: 'Bảo Trì Hệ Thống');
  }
}
