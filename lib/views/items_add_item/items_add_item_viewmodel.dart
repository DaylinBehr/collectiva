import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../models/item_model.dart';
import '../../services/authentication_service.dart';
import '../../services/firestore_service.dart';
import '../../services/image_method_service.dart';
import '../../services/storage_service.dart';


class AddItemViewModel extends BaseViewModel{
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

 Future<void> getDate(BuildContext context) async{
  await DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime.now(),
      onConfirm: (date) {
       _goalCompleteDate = date;
      }, currentTime: DateTime.now(), locale: LocaleType.en);
 }

 navigateToCollections() {
  _navigationService.back();
 }

 Future<String?> pickImage() async {
  XFile?  pickedXFile = await _imageMethod.selectImage();
  var data =
  await _cloudStorageService.uploadImage(imageToUpload: pickedXFile);


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

 Future addNewItem(
     {required String name,
      required String description,
      required String quantity,
      required String collectionID,
   }) async {
  setBusy(true);

  var result = await _fireStoreService.addItem(
      itemModel: ItemModel(
       name: name,
       description: description,
        quantity: quantity,
       image: _pickedFile,
       createdOn: Timestamp.now(),
       addDate: Timestamp.now(), fields: [],

      ),
      user: _authService.currentFireStoreUser!, collectionID: collectionID);
  setBusy(false);
  notifyListeners();

  _navigationService.popRepeated(2);
  _navigationService.navigateTo(Routes.itemsView);
 }

 void navigateToItems(){
  _navigationService.back();
 }
 int _customCount = 4;

 int get customCount => _customCount;

 set customCount(int value) {
  _customCount = value;
  notifyListeners();
 }
}