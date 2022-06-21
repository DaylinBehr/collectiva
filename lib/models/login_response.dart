import 'package:firebase_auth/firebase_auth.dart';

class LoginResponse {
  UserCredential? loginUserResponse;
  String? errorCode = "";
  String? errorMessage = "";
  String? statusMessage;

  LoginResponse(
      {required this.loginUserResponse,
      required this.statusMessage,
      this.errorCode = "",
      this.errorMessage = ""});
}
