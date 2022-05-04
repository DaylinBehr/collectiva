
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

class AuthService with ReactiveServiceMixin{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FireStoreService _fireStoreService = locator<FireStoreService>();
  UserModel? _currentFireStoreUser;
  UserModel? get currentFireStoreUser => _currentFireStoreUser;

  get email => null;

  get password => null;
  Future<User?> performLogin(String provider, List<String> scopes,
      Map<String, String> parameters) async {
    try {
      // print(_firebaseAuth.currentUser?.email);
      User? user = (await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password)) as User?;
      if(!await _fireStoreService.userExists(user)){
        _fireStoreService.createUser(UserModel(id: user!.uid, email: user.email!, name: user.displayName!, photoUrl: user.photoURL!));
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

  Future<User?> performLogOut() async{
    await _firebaseAuth.signOut();
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
      if (data is UserModel?){
        _currentFireStoreUser = data;
      } else{
        // _currentUser = null;
        await performLogOut();
      }
      return data;
    }
    else return null;
  }
}