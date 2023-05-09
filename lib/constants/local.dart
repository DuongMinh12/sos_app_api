import '../app_state.dart';

var userTouken = {AppState.instance.settingBox.read(SettingType.userTouken.toString())};

var urlapiregister= local + '/api/user/register-acount';
var urlapilogin= local + '/api/auth/login';
var urlapiUser= local + '/api/login/${userTouken}';
var urlotp = local + '/api/auth/otp-verify';

var urlListbank = local + '/api/bank/list';

var local = 'http://192.168.0.191:3000';