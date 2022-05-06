import 'package:collectiva/app/app.locator.dart';
import 'package:collectiva/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CollectionsViewModel extends IndexTrackingViewModel {
final NavigationService _navigationService = locator<NavigationService>();
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
Future signOutNavigation() async {
  await _navigationService.clearStackAndShow(Routes.startUp);
}
Future navigateToEditProfile() async {
  await _navigationService.navigateTo(Routes.editProfileView);
}
Future navigateToPasswordReset() async {
  await _navigationService.navigateTo(Routes.resetPasswordView);
}
}