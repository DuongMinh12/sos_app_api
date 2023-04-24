import 'package:local_auth/local_auth.dart';

class BioAuth{
  static final _auth = LocalAuthentication();
  static Future<bool> _canAuthenticate() async => await _auth.canCheckBiometrics || await _auth.isDeviceSupported();
}