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
    var hasLoggedInUser = await _authenticationService.isUserLoggedIn();

    if (hasLoggedInUser) {
      _navigationService.clearStackAndShow(Routes.collectionsView);
    } else {
      _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}