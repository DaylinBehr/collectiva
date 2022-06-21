import 'package:collectiva/app/app.router.dart';
import 'package:collectiva/models/login_response.dart';
import 'package:collectiva/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../themes/snack_bar_theme.dart';

class LoginViewModel extends BaseViewModel{
bool _isPasswordHidden = true;
bool get isPasswordHidden => _isPasswordHidden;
final NavigationService _navigationService = locator<NavigationService>();
final SnackbarService _snackbarService = locator<SnackbarService>();
final AuthService _authService = locator<AuthService>();
  void setPasswordVisibility(){
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }


  Future navigateToRegister() async{
    await _navigationService.clearStackAndShow(Routes.registerView);
  }

  Future navigateToCollections() async{
    await _navigationService.clearStackAndShow(Routes.collectionsView);
  }

  Future<LoginResponse?> loginUser(String email, String password) async {
    setBusy(true);
    var response = await _authService.performLogin(email, password);
    if(response?.loginUserResponse != null){
      setBusy(false);
      _snackbarService.showCustomSnackBar(
          title: "Login",
          message: '${response?.statusMessage}',
          variant: SnackBarType.greenAndBlack,
          duration: const Duration(milliseconds: 3000))?.then((value) async{
        await _navigationService.clearStackAndShow(Routes.collectionsView);
      });
      return response;
    } else if(response?.loginUserResponse == null){
      setBusy(false);
      _snackbarService.showCustomSnackBar(
          title: "Login",
          message: '${response?.statusMessage}',
          variant: SnackBarType.redAndWhite,
          duration: const Duration(milliseconds: 3000));
      return response;
    }
    return null;
    }
}