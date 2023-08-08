import 'package:collectiva/app/app.locator.dart';
import 'package:collectiva/services/storage_service.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:stacked_services/stacked_services.dart';

import '../themes/snack_bar_theme.dart';

/// Class that handles the user option when uploading a file
/// Provides the user with the ability to upload from gallery or camera
class ImageMethodService {
  final ImagePicker _picker = ImagePicker();
  final SnackbarService _snackbarService = locator<SnackbarService>();
  Future<XFile?> selectImage() async {
    try {
      return await _picker.pickImage(source: ImageSource.gallery);
    } on PlatformException catch (e) {
      _snackbarService.showCustomSnackBar(
          title: "Error Picking Image with code: ${e.code}",
          message: '${e.message}',
          variant: SnackBarType.redAndWhite,
          duration: const Duration(milliseconds: 3000));
    }
    return null;
  }

  /// Method that sets the image source to open the camera.
  /// The result is then an image from the camera in the form of an XFile.
  Future<XFile?> selectCamera() async {
    try {
      return await _picker.pickImage(source: ImageSource.camera);
    } on PlatformException catch (e) {
      _snackbarService.showCustomSnackBar(
          title: "Error Taking Image with code: ${e.code}",
          message: '${e.message}',
          variant: SnackBarType.redAndWhite,
          duration: const Duration(milliseconds: 3000));
    }
    return null;
  }
}
