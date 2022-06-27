import 'package:collectiva/app/app.locator.dart';
import 'package:collectiva/app/app.router.dart';
import 'package:collectiva/models/user_model.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../models/item_model.dart';
import '../../services/authentication_service.dart';
import '../../services/firestore_service.dart';

class ItemsViewModel extends ReactiveViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final FireStoreService _fireStoreService = locator<FireStoreService>();
  String _name = '';
  String get name => _name;
  List<ItemModel?>? _postedItems = [];
  List<ItemModel?>? get postedItems => _postedItems;
  Future navigateToAddItem(String collectionID) async {
    await _navigationService.navigateTo(Routes.addItemView, arguments: AddItemViewArguments(collectionID: collectionID));
  }

  Future fetchItems(String collectionID) async {
    try {
      setBusy(true);
      if (await _authService.isUserLoggedIn()) {
        var itemList = await _fireStoreService
            .getPostedItems(_authService.currentFireStoreUser, collectionID);
        // if (kDebugMode) {
        //   print(postedIssueResults);
        // }
        if (itemList is List<ItemModel?>?) {
          _postedItems = itemList;
          setBusy(false);
          notifyListeners();
        } else if (itemList == null) {
          setBusy(false);
          _postedItems = [];
          notifyListeners();
        }
        // else {
        //   setBusy(false);
        //   await _dialogService.showCustomDialog(
        //       variant: DialogType.alertErrorDialog,
        //       barrierDismissible: true,
        //       mainButtonTitle: 'Close',
        //       title: 'Error Fetching Issue',
        //       description: 'Please check your internet connection.');
        // }
      } else {
        setBusy(false);
      }
    } catch (err) {
      setBusy(false);
    }
  }

  Future navigateToEditItem(String id) async {
    await _navigationService.navigateTo(Routes.editItemView);
  }
  Future navigateToViewItem(String id) async {
    await _navigationService.navigateTo(Routes.itemView);
  }

  Future<void> deleteItem(String id)async {

  }

  @override
  // TODO: implement reactiveServices
  List<ReactiveServiceMixin> get reactiveServices => [];


}
