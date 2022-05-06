import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../services/authentication_service.dart';

class StartUpViewModel extends BaseViewModel{
  final AuthService _authenticationService =
  locator<AuthService>();
  final NavigationService _navigationService = locator<NavigationService>();

  Future handleStartUpLogic() async {
    // setBusy(true);
    notifyListeners();
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.clearStackAndShow(Routes.collectionsView);
      // setBusy(false);
    }
    // else {
      // _navigationService.clearStackAndShow(Routes.loginView);
      setBusy(false);
    notifyListeners();
    // }
  }

  Future navigateToLoginView() async {
    await _navigationService.navigateTo(Routes.loginView);
  }
  Future navigateToRegisterView()async {
    await _navigationService.navigateTo(Routes.registerView);
  }
}