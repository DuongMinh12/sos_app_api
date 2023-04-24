import '../app_state.dart';

var userTouken = {AppState.instance.settingBox.read(SettingType.userTouken.toString())};

var urlapiregister= local + 'register';
var urlapilogin= local + 'login';
var urlapiUser= local + 'login/${userTouken}';


var local = 'http://192.168.0.193:3000/api/';