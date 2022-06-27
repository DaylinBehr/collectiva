import 'package:collectiva/services/authentication_service.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../themes/snack_bar_theme.dart';

class ResetPasswordViewModel extends BaseViewModel {
  bool _isPasswordHidden = true;
  bool get isPasswordHidden => _isPasswordHidden;
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final AuthService _authService = locator<AuthService>();
  void setPasswordVisibility() {
    _isPasswordHidden = !_isPasswordHidden;
    notifyListeners();
  }

  Future<void> sendPasswordReset(String email) async {
    var result = await _authService.passwordReset(email);
    _snackbarService.showCustomSnackBar(
        title: "Password Reset",
        message: result,
        variant: SnackBarType.redAndWhite,
        duration: const Duration(milliseconds: 3000));
  }
}

class EditProfileViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  final AuthService _authService = locator<AuthService>();
  Future<void> updateEmail(String email) async {
    var result = await _authService.updateEmail(email);
    _snackbarService.showCustomSnackBar(
        title: "Email Update",
        message: result,
        variant: SnackBarType.redAndWhite,
        duration: const Duration(milliseconds: 3000));
  }
}
