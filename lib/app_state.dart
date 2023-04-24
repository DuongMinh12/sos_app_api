import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum SettingType { tokenCode, emaillogin, passwordlogin, userTouken }

class AppState extends GetxController {
  static final AppState instance = AppState();
  final settingBox = GetStorage();
}

// token = AppState.instance.settingBox.read(SettingType.tokenCode.toString());
// AppState.instance.settingBox.write(SettingType.notify_id.toString(), message.data['notify_id']);