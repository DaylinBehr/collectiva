import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../app/app.locator.dart';
import '../../app/app.router.dart';
import '../../models/collection_model.dart';
import '../../services/authentication_service.dart';
import '../../services/firestore_service.dart';
import '../../services/image_method_service.dart';
import '../../services/storage_service.dart';


class EditCollectionViewModel extends BaseViewModel{
 final NavigationService _navigationService = locator<NavigationService>();
 final SnackbarService _snackBarService = locator<SnackbarService>();
 final ImageMethodService _imageMethod = locator<ImageMethodService>();
 final CloudStorageService _cloudStorageService =
 locator<CloudStorageService>();
 final FireStoreService _fireStoreService = locator<FireStoreService>();
 final AuthService _authService = locator<AuthService>();
 String? _pickedFile, _collectionName, _collectionDescription, _collectionGoals;
 //
 String? get pickedFile => _pickedFile;
 String? get collectionName => _collectionName;
 String? get collectionDescription => _collectionDescription;
 String? get collectionGoals => _collectionGoals;
 DateTime? _goalCompleteDate;
 DateTime? get goalCompleteDate => _goalCompleteDate;

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
 Future<void> getGoalCompletionDate(BuildContext context) async{
  await DatePicker.showDatePicker(context,
      showTitleActions: true,
      minTime: DateTime.now(),
      onConfirm: (date) {
       _goalCompleteDate = date;
      }, currentTime: DateTime.now(), locale: LocaleType.en);
 }
 Future editCollection(
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

 Future<void> loadCollection(String id) async {
   var collectionItem = await _fireStoreService.getCollectionDetails(id: id, user: _authService.currentFireStoreUser!);

   if(collectionItem is DocumentSnapshot<Map<String, dynamic>>){
     var data = CollectionModel.fromFirestore(collectionItem, SnapshotOptions());
     _collectionName = data.collectionName;
         _collectionDescription = data.collectionDescription;
         _collectionGoals = data.collectionGoal;
         _pickedFile = data.collectionImageLocation;
         notifyListeners();
   }

 }
//  navigateToCollections() {
//   _navigationService.back();
// }
}