import 'status.dart';

class LoginResponse {
  Status status;
  String message;

  LoginResponse(this.status, [this.message]);
}
