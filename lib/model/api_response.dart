import 'status.dart';

class ApiResponse<T> {
  Status status;
  String message;
  T body;
  ApiResponse(this.status, {this.message, this.body});
}
