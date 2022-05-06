import 'package:collectiva/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';

class LoginViewModel extends BaseViewModel{
bool _isPasswordHidden = true;

bool get isPasswordHidden => _isPasswordHidden;
final NavigationService _navigationService = locator<NavigationService>();
  void setPasswordVisibility(){
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }


  Future navigateToRegister() async{
    await _navigationService.navigateTo(Routes.registerView);
  }

  Future navigateToCollections() async{
    await _navigationService.clearStackAndShow(Routes.collectionsView);
  }

}