import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class BaseApi {
  static final BaseApi _singleton = BaseApi._internal();
  static String basePath = "http://10.0.2.2:8080/";
  String _jwt = "";

  String get jwt => _jwt;

  set jwt(String value) {
    _jwt = value;
  }

  factory BaseApi() {
    return _singleton;
  }

  BaseApi._internal() {}

  /* Future<Response> getRequest(String url, Map<String, dynamic> queryParameters,
      {String jwt}) {
    if (jwt == null) {
      return http.get(basePath + url, queryParameters: queryParameters);
    } else {
      return dio.get(
        basePath + url,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'Authorization': 'Bearer $jwt',
          },
        ),
      );
    }
  }*/

  Future<Response> postRequest(String url, {dynamic data}) {
    if (jwt == "") {
      return http.post(basePath + url, body: data);
    } else {
      return http.post(basePath + url,
          body: data, headers: {'Authorization': "Bearer $jwt"});
    }
  }
}
