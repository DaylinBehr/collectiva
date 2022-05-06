import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';

class ResetPasswordViewModel extends BaseViewModel{
  bool _isPasswordHidden = true;

  bool get isPasswordHidden => _isPasswordHidden;
  final NavigationService _navigationService = locator<NavigationService>();
  void setPasswordVisibility(){
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }
void save(){

}
}

class EditProfileViewModel extends BaseViewModel{
  final NavigationService _navigationService = locator<NavigationService>();


void save(){


}
}