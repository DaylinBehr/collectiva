import 'package:firebase_auth/firebase_auth.dart';

/// This is a custom response data-model for managing the response from the Firebase Auth SDK
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
