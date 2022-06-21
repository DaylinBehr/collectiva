import 'package:collectiva/services/image_method_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:image_picker/image_picker.dart';
import '../../app/app.locator.dart';
import '../../services/storage_service.dart';
import '../../themes/snack_bar_theme.dart';

class AddCollectionViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final ImageMethodService _imageMethod = locator<ImageMethodService>();
  final CloudStorageService _cloudStorageService = locator<CloudStorageService>();
   XFile? _pickedFile;

  XFile? get pickedFile => _pickedFile;
  // DateTime _datePicked = DateTime.now();

  // DateTime get datePicked => _datePicked;

  navigateToCollections() {
    _navigationService.back();
  }

  Future pickImage() async {
      _pickedFile = await _imageMethod.selectImage();
      var data = await _cloudStorageService.uploadImage(imageToUpload: _pickedFile);

      if (kDebugMode) {
        print(data?.imageFileName);
        print(data?.imageUrl);
      }
      notifyListeners();
  }

  Future pickCamera() async {
      _pickedFile = await _imageMethod.selectImage();
      notifyListeners();
  }
}
