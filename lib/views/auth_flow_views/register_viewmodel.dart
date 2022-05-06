import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class RegisterViewModel extends BaseViewModel{
   final NavigationService _navigationService = locator<NavigationService>();
   bool _isPasswordHidden = true;

   bool get isPasswordHidden => _isPasswordHidden;
   void setPasswordVisibility(){
     _isPasswordHidden = !_isPasswordHidden;
     notifyListeners();
   }
  Future navigateToLogin() async{
    await _navigationService.navigateTo(Routes.loginView);
  }
}