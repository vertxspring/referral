import 'package:simhadri_referral/model/login_response.dart';
import 'package:simhadri_referral/model/status.dart';

class LoginService {
  static final LoginService _singleton = LoginService._internal();

  factory LoginService() {
    return _singleton;
  }

  LoginService._internal() {}

  LoginResponse attemptLogin(String mobile) {
    return LoginResponse(Status.SUCCESS);
  }
}
