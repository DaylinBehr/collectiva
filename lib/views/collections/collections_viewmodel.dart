import 'package:collectiva/app/app.locator.dart';
import 'package:collectiva/app/app.router.dart';
import 'package:collectiva/models/user_model.dart';
import 'package:collectiva/services/authentication_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CollectionsViewModel extends IndexTrackingViewModel {
final NavigationService _navigationService = locator<NavigationService>();
final AuthService _authenticationService = locator<AuthService>();
String _name = '';
String get name => _name;

Future<void> getUsername() async {
  _name = _authenticationService.currentFireStoreUser!.name;
  notifyListeners();
}
  Future navigateToAddCollection() async {
    setIndex(0);
    await _navigationService.navigateTo(Routes.addCollectionView);
  }
Future navigateToEditCollection() async {
  await _navigationService.navigateTo(Routes.editCollectionView);
}
Future navigateToItems() async {
  await _navigationService.navigateTo(Routes.itemsView);
}
Future signOut() async {
   _authenticationService.performLogOut().then((value) async {
     await _navigationService.clearStackAndShow(Routes.startUp);
   });

}
Future navigateToEditProfile() async {
  await _navigationService.navigateTo(Routes.editProfileView);
}
Future navigateToPasswordReset() async {
  await _navigationService.navigateTo(Routes.resetPasswordView);
}
}