import 'package:collectiva/services/authentication_service.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../app/app.locator.dart';

import '../models/cloud_storage_result_model.dart';

/// Class that handles the uploading and downloading of Firebase Storage objects
class CloudStorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final AuthService _authService = locator<AuthService>();
  double _bytesTransferredPercent = 0.0;

  double get bytesTransferredPercent => _bytesTransferredPercent;

  /// Future Functions that uploads an Image to Firebase Storage
  /// Returns an object of type [CloudStorageResult]
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
    /// New Firebase Storage Upload Task
    UploadTask uploadTask =
        firebaseStorageRef.putFile(File(imageToUpload.path), metadata);
    //
    TaskSnapshot storageSnapshot = uploadTask.snapshot;
    /// Displays the current transferred bytes of the task.
  _bytesTransferredPercent=storageSnapshot.bytesTransferred/storageSnapshot.totalBytes;
    await uploadTask;
var downloadUrl = await storageSnapshot.ref.getDownloadURL();
    var url = downloadUrl.toString();
    return CloudStorageResult(
      imageUrl: url,
      imageFileName: imageFileName,
      task: uploadTask
    );
  }
}


