import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';


class AddCollectionViewModel extends BaseViewModel{
final NavigationService _navigationService = locator<NavigationService>();

  // DateTime _datePicked = DateTime.now();

  // DateTime get datePicked => _datePicked;

 navigateToCollections() {
  _navigationService.back();
}
}