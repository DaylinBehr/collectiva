import 'package:cloud_firestore/cloud_firestore.dart';


/// Data-model Class for managing collections of items in the application.
class CollectionModel {
  final String? collectionName;
  final String? collectionDescription;
  final String? collectionImageLocation;
  final String? collectionGoal;
  final String? collectionID;
  final Timestamp? collectionCreateDate;
  final Timestamp? collectionGoalDate;

  /// Constructor
  CollectionModel(
      {required this.collectionName,
      required this.collectionDescription,
      required this.collectionGoal,
      required this.collectionImageLocation,
      required this.collectionCreateDate,
      required this.collectionGoalDate,
      this.collectionID = ''});

  /// Factory that converts firestore document objects into a dart object of type Collection Model
  factory CollectionModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CollectionModel(
      collectionName: data?['collectionName'],
      collectionDescription: data?['collectionDescription'],
      collectionImageLocation: data?['collectionImageLocation'],
      collectionGoal: data?['collectionGoal'],
      collectionID: data?['collectionID'],
      collectionCreateDate: data?['collectionCreateDate'],
      collectionGoalDate: data?['collectionGoalDate'],
    );
  }

  /// Method to convert a CollectionModel object back to a map that in read in by Firebase
  Map<String, dynamic> toFirestore() {
    return {
      if (collectionName != null) "collectionName": collectionName,
      if (collectionDescription != null) "collectionDescription": collectionDescription,
      if (collectionImageLocation != null) "collectionImageLocation": collectionImageLocation,
      if (collectionGoal != null) "collectionGoal": collectionGoal,
      if (collectionID != null) "collectionID": collectionID,
      if (collectionCreateDate != null)
        "collectionCreateDate": collectionCreateDate,
      if (collectionGoalDate != null) "collectionGoalDate": collectionGoalDate,
    };
  }
}
