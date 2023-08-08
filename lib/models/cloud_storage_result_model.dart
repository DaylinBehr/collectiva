import 'package:firebase_storage/firebase_storage.dart';

/// A wrapper class that only contains necessary information from a firebase storage upload result
class CloudStorageResult {
  final String imageUrl;
  final String imageFileName;
  final UploadTask task;

  CloudStorageResult({required this.imageUrl, required this.imageFileName, required this.task});
}