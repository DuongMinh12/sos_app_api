import '../app_state/app_state.dart';

// var id = AppState.instance.settingBox.read(SettingType.idUser.toString());
var local = 'http://192.168.0.191:3000';
var localOnline = 'https://sos-ixmh.onrender.com';
var token = AppState.instance.settingBox.read(SettingType.accessToken.toString());
var inService = AppState.instance.settingBox.read(SettingType.idService.toString());
//AppState.instance.settingBox.remove(SettingType.accessToken.toString());

/// customer account
var urlapiregister= localOnline + '/api/user/register-acount';
var urlapilogin= localOnline + '/api/auth/login';
var urlapiUserPro5= localOnline + '/api/user/profile';
var urlUpdateUserPro5 = localOnline + '/api/user/update-user-profile';
var urlUpdateUserAvatar = localOnline + '/api/user/update-avatar';
var urlDeleAcc = localOnline + '/api/user/delete';
var urlotp = localOnline + '/api/auth/otp-verify';


/// service
var urlAddService = localOnline + "/api/services/add-service";
var urlGetListService =  localOnline + '/api/services/get-services';
var uploadImage = localOnline +'/api/services/update-avatar';
var urlChangeState = localOnline + '/api/services/update-state';
var urlOtpState = localOnline + '/api/auth/get-otp';
var urlDeleteService = localOnline + '/api/services/delete';
var urlUpdateService = localOnline + '/api/services/update-service';


// var urlAddBank = local + '/api/userbank/add';
var urlListbank = localOnline + '/api/bank/list';

var urllocalImage = localOnline;
