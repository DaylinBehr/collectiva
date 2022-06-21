import 'package:collectiva/models/login_response.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
// import 'package:firebase_auth_oauth/firebase_auth_oauth.dart';
import 'package:flutter/services.dart';
// import 'package:my_rcl/app.locator.dart';
// import 'package:my_rcl/models/user.dart';
// import 'package:my_rcl/services/firestore_service.dart';
import 'package:stacked/stacked.dart';

import '../app/app.locator.dart';
import '../models/user_model.dart';
import 'firestore_service.dart';

class AuthService with ReactiveServiceMixin {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService = locator<FireStoreService>();
  UserModel? _currentFireStoreUser;
  UserModel? get currentFireStoreUser => _currentFireStoreUser;

  Future<LoginResponse?> performLogin(String email, String password) async {
    try {
      UserCredential? userCred = (await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password));
      return LoginResponse(
          loginUserResponse: userCred, statusMessage: "Successful Login");
    } on PlatformException catch (error) {
      debugPrint("${error.code}: ${error.message}");
    } on FirebaseAuthException catch (error) {
      switch (error.code) {
        case 'user-not-found':
          return LoginResponse(
              loginUserResponse: null,
              statusMessage: "Account Does Not Exist!",
              errorCode: error.code,
              errorMessage: error.message!);
        case 'wrong-password':
          return LoginResponse(
              loginUserResponse: null,
              statusMessage: "Incorrect Email Address or Password",
              errorCode: error.code,
              errorMessage: error.message!);
        case 'invalid-email':
          return LoginResponse(
              loginUserResponse: null,
              statusMessage: "Incorrect Email Address or Password",
              errorCode: error.code,
              errorMessage: error.message!);
        case 'user-disabled':
          return LoginResponse(
              loginUserResponse: null,
              statusMessage: "Your Account Has Been Disabled!\nPlease Contact Support",
              errorCode: error.code,
              errorMessage: error.message!);
        case 'network-request-failed':
          return LoginResponse(
              loginUserResponse: null,
              statusMessage: "Network Error!\nYou Are Offline Please Check Your Network Connection",
              errorCode: error.code,
              errorMessage: error.message!);
        default:
          return LoginResponse(
              loginUserResponse: null,
              statusMessage: "${error.code}: ${error.message}",
              errorCode: error.code,
              errorMessage: error.message!);
      }
    }
    return null;
  }

  Future<UserCredential?> registerUser(String regEmail, String regPassword,
      String regUsername, String regName) async {
    try {
      // print(_firebaseAuth.currentUser?.email);
      UserCredential? user =
          (await _firebaseAuth.createUserWithEmailAndPassword(
              email: regEmail, password: regPassword));

      if (!await _fireStoreService.userExists(user.user)) {
        _fireStoreService.createUser(UserModel(
            id: user.user!.uid,
            email: user.user!.email!,
            name: regName,
            username: regUsername));
      }

      // print(_firebaseAuth.currentUser?.email);
      return user;
    } on PlatformException catch (error) {
      /**
       * The plugin has the following error codes:
       * 1. FirebaseAuthError: FirebaseAuth related error
       * 2. PlatformError: An platform related error
       * 3. PluginError: An error from this plugin
       */
      debugPrint("${error.code}: ${error.message}");
    }
    return null;
  }

  Future<User?> performLogOut() async {
    await _firebaseAuth.signOut();
    _currentFireStoreUser = null;
    return _firebaseAuth.currentUser;
  }

  Stream<User?> getAuthState() {
    return _firebaseAuth.authStateChanges();
  }

  Future<bool> isUserLoggedIn() async {
    var user = _firebaseAuth.currentUser;
    return await _populateCurrentUser(user) != null;
  }

  Future<UserModel?> _populateCurrentUser(User? user) async {
    if (user != null) {
      var data = await _fireStoreService.getUser(user.uid);
      if (data is UserModel?) {
        _currentFireStoreUser = data;
      } else {
        // _currentUser = null;
        await performLogOut();
      }
      return data;
    } else {
      return null;
    }
  }
}
