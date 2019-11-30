import 'package:http/http.dart';
import 'package:simhadri_referral/model/api_response.dart';
import 'package:simhadri_referral/model/status.dart';
import 'package:simhadri_referral/resources/base_api.dart';

class LoginService {
  static final LoginService _singleton = LoginService._internal();

  factory LoginService() {
    return _singleton;
  }

  LoginService._internal() {}

  Future<ApiResponse<String>> attemptLogin(String mobile) async {
    Response res = await BaseApi()
        .postRequest("token/generate-affiliate-token", data: mobile);
    print(mobile);

    print(res.statusCode);
    if (res.statusCode == 200) {
      BaseApi().jwt = res.body;
      return ApiResponse<String>(Status.SUCCESS);
    }
    return ApiResponse<String>(Status.FAIL);
  }
}
