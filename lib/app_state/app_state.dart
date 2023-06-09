import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

enum SettingType { emaillogin, passwordlogin, accessToken, biometricState, bankid, idService}

class AppState extends GetxController {
  static final AppState instance = AppState();
  final settingBox = GetStorage();
}

// token = AppState.instance.settingBox.read(SettingType.tokenCode.toString());
// AppState.instance.settingBox.write(SettingType.notify_id.toString(), message.data['notify_id']);
// AppState.instance.settingBox.remove(SettingType.accessToken.toString());