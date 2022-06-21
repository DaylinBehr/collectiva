import 'package:collectiva/services/authentication_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../app/app.locator.dart';
import 'package:flutter/material.dart';

class CloudStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final AuthService _authService = locator<AuthService>();
  double _bytesTransferredPercent = 0.0;

  double get bytesTransferredPercent => _bytesTransferredPercent;
  Future<CloudStorageResult?> uploadImage({
    required XFile? imageToUpload,
  }) async {
    var imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

    final Reference firebaseStorageRef = _firebaseStorage
        .ref()
        .child("images")
        .child("${_authService.currentFireStoreUser?.id}")
        .child("collection_images")
        .child("collection_Id") // TODO: Implement Actual CollectionID
        .child("/${imageFileName}_collectionName_image"); // TODO: Implement Actual Collection Name
    final metadata = SettableMetadata(
      contentType: 'image/jpeg',
      customMetadata: {
        'picked-file-path': imageToUpload!.path,
        'uploadedById': _authService.currentFireStoreUser!.id
      },
    );
    UploadTask uploadTask =
        firebaseStorageRef.putFile(File(imageToUpload.path), metadata);
    //
    TaskSnapshot storageSnapshot = uploadTask.snapshot;
    /// Displays the current transferred bytes of the task.


  // _bytesTransferredPercent=storageSnapshot.bytesTransferred/storageSnapshot.totalBytes;
  // if (kDebugMode) {
  //   print(_bytesTransferredPercent);
  // }

//
//
//     // uploadTask.whenComplete(() {
    await uploadTask;
var downloadUrl = await storageSnapshot.ref.getDownloadURL();
    var url = downloadUrl.toString();
    return CloudStorageResult(
      imageUrl: url,
      imageFileName: imageFileName,
      task: uploadTask
    );
    // });
    return null;
  }
}

class CloudStorageResult {
  final String imageUrl;
  final String imageFileName;
  final UploadTask task;

  CloudStorageResult({required this.imageUrl, required this.imageFileName, required this.task});
}
