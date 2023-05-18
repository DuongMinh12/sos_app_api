import '../app_state/app_state.dart';

// var id = AppState.instance.settingBox.read(SettingType.idUser.toString());
var local = 'http://192.168.0.191:3000';
var localOnline = 'https://sos-ixmh.onrender.com';
var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
var inService = AppState.instance.settingBox.read(SettingType.idService.toString());
//AppState.instance.settingBox.remove(SettingType.accessToken.toString());

/// customer account
var urlapiregister= local + '/api/user/register-acount';
var urlapilogin= local + '/api/auth/login';
var urlapiUserPro5= local + '/api/user/profile';
var urlUpdateUserPro5 = local + '/api/user/update-user-profile';
var urlUpdateUserAvatar = local + '/api/user/update-avatar';
var urlDeleAcc = local + '/api/user/delete';
var urlotp = local + '/api/auth/otp-verify';


/// service
var urlAddService = local + "/api/services/add-service";
var urlGetListService =  local + '/api/services/get-services';
var uploadImage = local +'/api/services/update-avatar';
var urlChangeState = local + '/api/services/update-state';
var urlOtpState = local + '/api/auth/get-otp';
var urlDeleteService = local + '/api/services/delete';
var urlUpdateService = local + '/api/services/update-service';


// var urlAddBank = local + '/api/userbank/add';
var urlListbank = local + '/api/bank/list';

var urllocalImage = local;
