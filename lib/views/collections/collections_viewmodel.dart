import 'package:collectiva/app/app.locator.dart';
import 'package:collectiva/app/app.router.dart';
import 'package:collectiva/models/collection_model.dart';
import 'package:collectiva/models/user_model.dart';
import 'package:collectiva/services/authentication_service.dart';
import 'package:collectiva/services/firestore_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class CollectionsViewModel extends FutureViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final AuthService _authService = locator<AuthService>();
  final FireStoreService _fireStoreService = locator<FireStoreService>();
  String _name = '';
  String get name => _name;
  List<CollectionModel?>? _postedCollections = [];
  List<CollectionModel?>? get postedCollections => _postedCollections;

  int _currentIndex = 0;
  int get currentIndex => _currentIndex;

  bool _reverse = false;

  /// Indicates whether we're going forward or backward in terms of the index we're changing.
  /// This is very helpful for the page transition directions.
  bool get reverse => _reverse;

  void setIndex(int value) {
    if (value < _currentIndex) {
      _reverse = true;
    } else {
      _reverse = false;
    }
    _currentIndex = value;
    notifyListeners();
  }

  bool isIndexSelected(int index) => _currentIndex == index;

  @override
  List<ReactiveServiceMixin> get reactiveServices => [];

  Future fetchCollections() async {
    try {
      setBusy(true);
      if (await _authService.isUserLoggedIn()) {
        var collectionList = await _fireStoreService
            .getPostedCollections(_authService.currentFireStoreUser);
        // if (kDebugMode) {
        //   print(postedIssueResults);
        // }
        if (collectionList is List<CollectionModel?>?) {
          _postedCollections = collectionList;
          setBusy(false);
          notifyListeners();
        } else if (collectionList == null) {
          setBusy(false);
          _postedCollections = [];
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

  Future<void> getUsername() async {
    _name = _authService.currentFireStoreUser!.name;
    notifyListeners();
  }

  Future navigateToAddCollection() async {
    setIndex(0);
    await _navigationService.navigateTo(Routes.addCollectionView);
  }

  Future navigateToEditCollection(String collectionId) async {
    await _navigationService.navigateTo(Routes.editCollectionView, arguments: EditCollectionViewArguments(collectionID: collectionId));
  }

  Future navigateToItems(String collectionID) async {
    await _navigationService.navigateTo(Routes.itemsView, arguments: ItemsViewArguments(collectionID: collectionID));
  }

  Future signOut() async {
    _authService.performLogOut().then((value) async {
      await _navigationService.clearStackAndShow(Routes.startUp);
    });
  }

  Future navigateToEditProfile() async {
    await _navigationService.navigateTo(Routes.editProfileView);
  }

  Future navigateToPasswordReset() async {
    await _navigationService.navigateTo(Routes.resetPasswordView);
  }

  @override
  Future futureToRun() async {
    // TODO: implement futureToRun
    await fetchCollections();
  }
}
