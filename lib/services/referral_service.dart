import 'package:http/http.dart';
import 'package:simhadri_referral/model/api_response.dart';
import 'package:simhadri_referral/model/status.dart';
import 'package:simhadri_referral/resources/base_api.dart';

class ReferralService {
  static final ReferralService _singleton = ReferralService._internal();

  factory ReferralService() {
    return _singleton;
  }

  ReferralService._internal() {}

  Future<ApiResponse<String>> generateReferralCode() async {
    Response res = await BaseApi().postRequest("generate-referral");

    print(res.statusCode);
    if (res.statusCode == 200) {
      return ApiResponse<String>(Status.SUCCESS, body: res.body);
    }
    return ApiResponse<String>(Status.FAIL);
  }
}
