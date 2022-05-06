import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';


class AddItemViewModel extends BaseViewModel{
 int _customCount = 1;

 int get customCount => _customCount;

 set customCount(int value) {
  _customCount = value;
  notifyListeners();
 }
final NavigationService _navigationService = locator<NavigationService>();

  // DateTime _datePicked = DateTime.now();

  // DateTime get datePicked => _datePicked;

 navigateToItems() {
  _navigationService.back();
}
}