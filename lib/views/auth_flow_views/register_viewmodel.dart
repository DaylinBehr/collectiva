import 'package:collectiva/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class RegisterViewModel extends BaseViewModel{
   final NavigationService _navigationService = locator<NavigationService>();
   final AuthService _authService = locator<AuthService>();
   bool _isPasswordHidden = true;

   bool get isPasswordHidden => _isPasswordHidden;
   void setPasswordVisibility(){
     _isPasswordHidden = !_isPasswordHidden;
     notifyListeners();
   }
  Future navigateToLogin() async{
    await _navigationService.navigateTo(Routes.loginView);
  }

  Future<void> registerUser(String email, String name, String username, String password ) async {

     final user =  await _authService.registerUser(email, password, username, name);
     if(user != null){
       _navigationService.navigateTo(Routes.loginView);
     }



  }

}