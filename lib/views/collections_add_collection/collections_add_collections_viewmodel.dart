import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collectiva/models/collection_model.dart';
import 'package:collectiva/services/authentication_service.dart';
import 'package:collectiva/services/firestore_service.dart';
import 'package:collectiva/services/image_method_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:image_picker/image_picker.dart';
import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../services/storage_service.dart';
import '../../themes/snack_bar_theme.dart';

class AddCollectionViewModel extends BaseViewModel {
  final NavigationService _navigationService = locator<NavigationService>();
  final SnackbarService _snackBarService = locator<SnackbarService>();
  final ImageMethodService _imageMethod = locator<ImageMethodService>();
  final CloudStorageService _cloudStorageService =
      locator<CloudStorageService>();
  final FireStoreService _fireStoreService = locator<FireStoreService>();
  final AuthService _authService = locator<AuthService>();
  String? _pickedFile;
  //
  String? get pickedFile => _pickedFile;
  DateTime? _goalCompleteDate;
  DateTime? get goalCompleteDate => _goalCompleteDate;

  navigateToCollections() {
    _navigationService.back();
  }

  Future<String?> pickImage() async {
    XFile?  pickedXFile = await _imageMethod.selectImage();
    var data =
        await _cloudStorageService.uploadImage(imageToUpload: pickedXFile);

    if (kDebugMode) {
      print(data?.imageFileName);
      print(data?.imageUrl);
    }
    notifyListeners();
    return data?.imageUrl;
  }

  Future<void> pickCamera() async {
    XFile? pickedXFile = await _imageMethod.selectCamera();
    notifyListeners();
    var data =
    await _cloudStorageService.uploadImage(imageToUpload: pickedXFile);
    _pickedFile = data?.imageUrl;
    notifyListeners();
  }
Future<void> getGoalCompletionDate(BuildContext context) async{
  await DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime.now(),
       onConfirm: (date) {
      _goalCompleteDate = date;
      }, currentTime: DateTime.now(), locale: LocaleType.en);
}
  Future addNewCollection(
      {required String name,
      required String description,
      required String goal}) async {
    setBusy(true);

    var result = await _fireStoreService.addCollection(
        collectionModel: CollectionModel(
          collectionID: _authService.currentFireStoreUser!.id,
          collectionName: name,
          collectionImageLocation: _pickedFile,
          collectionDescription: description,
          collectionGoal: goal,
          collectionCreateDate: Timestamp.now(),
          collectionGoalDate: Timestamp.fromDate(_goalCompleteDate!),

        ),
        user: _authService.currentFireStoreUser!);
    setBusy(false);
    notifyListeners();

    _navigationService.clearStackAndShow(Routes.collectionsView);
  }
}
