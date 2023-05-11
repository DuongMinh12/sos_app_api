import '../app_state/app_state.dart';

var id = AppState.instance.settingBox.read(SettingType.idUser.toString());
var local = 'http://192.168.0.191:3000';


var urlapiregister= local + '/api/user/register-acount';
var urlapilogin= local + '/api/auth/login';
var urlapiUser= local + '/api/user/$id';
var urlotp = local + '/api/auth/otp-verify';
// var urlAddBank = local + '/api/userbank/add';
var urlListbank = local + '/api/bank/list';
var urlUpdateUserPro5 = local + '/api/user/update-avatar';
