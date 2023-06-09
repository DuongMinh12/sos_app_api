
import 'package:flutter/material.dart';
import 'package:warning_app/screens/screens.dart';

final Map<String, WidgetBuilder> routes = {
  SplashPage.routeName: (context) => SplashPage(),
  LogInPage.routeName: (context) => LogInPage(),
  // SignUpPage.routeName: (context) => SignUpPage(),
  ProfilePage.routeName: (context) => ProfilePage(),
  TestPage.routeName: (context) => TestPage(),
  DrawerMenu.routeName: (context) => DrawerMenu(),
  ForgotPasswordPage.routeName: (context) => ForgotPasswordPage(),
  SignUpBottomSheetSceen.routeName: (context) => SignUpBottomSheetSceen(),
  OtpScreen.routeName: (context) => OtpScreen(),
  RechargeScreen.routeName: (context) => RechargeScreen(),
  PaymentScreen.routeName: (context) => PaymentScreen(),
  CloseSystem.routeName: (context) => CloseSystem(),
  MaintenanceScreen.routeName: (context) => MaintenanceScreen(),

  // PaymentPage.routeName: (context) => PaymentPage(),
  // WithdrawMoneyPage.routeName: (context) => WithdrawMoneyPage(),
};