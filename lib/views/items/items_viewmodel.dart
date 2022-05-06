import 'package:collectiva/app/app.locator.dart';
import 'package:collectiva/app/app.router.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class ItemsViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  Future navigateToAddItem() async {
    await _navigationService.navigateTo(Routes.addItemView);
  }

  Future navigateToEditItem() async {
    await _navigationService.navigateTo(Routes.editItemView);
  }
  Future navigateToViewItem() async {
    await _navigationService.navigateTo(Routes.itemView);
  }
}
