import 'package:cloud_firestore/cloud_firestore.dart';

import 'item_model.dart';

class CollectionModel {
  final String? collectionName;
  final String? collectionDescription;
  final String? collectionImageLocation;
  final String? collectionGoal;
  final String? collectionID;
  final Timestamp? collectionCreateDate;
  final Timestamp? collectionGoalDate;

  CollectionModel(
      {required this.collectionName,
      required this.collectionDescription,
      required this.collectionGoal,
      required this.collectionImageLocation,
      required this.collectionCreateDate,
      required this.collectionGoalDate,
      this.collectionID = ''});

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
