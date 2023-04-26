import '../app_state.dart';

var userTouken = {AppState.instance.settingBox.read(SettingType.userTouken.toString())};

var urlapiregister= local + 'user/register-acount';
var urlapilogin= local + 'auth/login';
var urlapiUser= local + 'login/${userTouken}';
var urlotp = local + '/auth/otp-verify';

var local = 'http://192.168.0.175:3000/api/';