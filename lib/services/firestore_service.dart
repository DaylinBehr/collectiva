import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collectiva/models/item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../models/collection_model.dart';
import '../models/user_model.dart';

/// Class that handles all Firestore interaction
class FireStoreService {
  final CollectionReference _collectionsCollectionReference =
      FirebaseFirestore.instance.collection('collections');

  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');

  /// Get all collections for the user
  Future getPostedCollections(UserModel? user) async {
    try {
      var collectionQuerySnap =
         await _collectionsCollectionReference.doc(user?.id).collection('user_collections').get();
          // withConverter(
          //       fromFirestore: CollectionModel.fromFirestore,
          //       toFirestore: (CollectionModel collectionModel, _) =>
          //           collectionModel.toFirestore(),
          //     );
      // final docSnap = await collectionDocRef.get();
      // final collectionModel = docSnap.data();
      if (collectionQuerySnap.docs.isNotEmpty) {
        return collectionQuerySnap.docs.map((snapshot) => CollectionModel.fromFirestore(snapshot, SnapshotOptions()))
            .where((mappedItem) => mappedItem?.collectionID != null)
            .toList();
      }
      // if (collectionModel != null) {
      //   return collectionModel;
      // }
    } on PlatformException catch (err) {
        return err.message;
    } catch (err){
      return err;
    }
  }

  /// Get items for the user in that Collection
  Future getPostedItems(UserModel? user, String collectionID) async {
    try {
      var itemQuerySnap =
      await _collectionsCollectionReference.doc(user?.id).collection('user_collections').doc(collectionID).collection('items').get();
      // withConverter(
      //       fromFirestore: CollectionModel.fromFirestore,
      //       toFirestore: (CollectionModel collectionModel, _) =>
      //           collectionModel.toFirestore(),
      //     );
      // final docSnap = await collectionDocRef.get();
      // final collectionModel = docSnap.data();
      if (itemQuerySnap.docs.isNotEmpty) {
        return itemQuerySnap.docs.map((snapshot) => ItemModel.fromFirestore(snapshot, SnapshotOptions()))
            .where((mappedItem) => mappedItem?.id != null)
            .toList();
      }
      // if (collectionModel != null) {
      //   return collectionModel;
      // }
    } on PlatformException catch (err) {
      return err.message;
    } catch (err){
      return err;
    }
  }

/// Add a collection to firebase firestore for that user
  Future addCollection({required CollectionModel collectionModel, required UserModel user}) async {
    try {
    var collectionId = await _collectionsCollectionReference
          .doc(user?.id).collection('user_collections')
          .add(collectionModel.toFirestore());
   await _collectionsCollectionReference.doc(user?.id).collection('user_collections').doc(collectionId.id).update(
       {'collectionID': collectionId.id});
   await _collectionsCollectionReference.doc(user?.id).collection('user_collections').doc(collectionId.id).collection('items').doc().set(
       {});

      // await _issuesCollectionReference.add(issue.toMap());
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }
      return err.toString();
    }
  }

  /// Add an item to firebase firestore for that user in their desired collection
  Future addItem({required ItemModel itemModel, required UserModel user, required String collectionID}) async {
    try {
      var itemId = await _collectionsCollectionReference
          .doc(user?.id).collection('user_collections').doc(collectionID).collection('items')
          .add(itemModel.toFirestore());
      await _collectionsCollectionReference.doc(user?.id).collection('user_collections').doc(collectionID).collection('items').doc(itemId.id).update(
          {'id': itemId.id});
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }
      return err.toString();
    }
  }

  /// Get a singular collection from firestore fro that user
Future getCollectionDetails({required String id, required UserModel user})async {
    try{
      return await _collectionsCollectionReference.doc(user?.id).collection('user_collections').doc(id).get();
    }catch(err){
      return err;
    }
}

/// Delete a Collection from firestore for that user
  Future deletePostedCollection(String queryID, UserModel? user) async {
    try {
      await _collectionsCollectionReference
          .doc(user?.id)
          .collection('user_collections')
          .doc(queryID)
          .delete();
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }

      return err.toString();
    }
  }

  /// Create a User in firestore
  Future createUser(UserModel user) async {
    try {
      await _usersCollectionReference.doc(user.id).set(UserModel.toJson(user));
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }

      return e.toString();
    }
  }

  /// Check if a user exists already against the firestore users collection
  Future<bool> userExists(User? currUser) async {
    DocumentReference userExists = _usersCollectionReference.doc(currUser!.uid);
    var data = await userExists.get();
    return data.exists;
  }

  /// Get a singular user
  Future getUser(String id) async {
    UserModel? fetchedUser;
    try {
      await _usersCollectionReference
          .doc(id)
          .get()
          .then((DocumentSnapshot? documentSnapshot) {
        if (documentSnapshot!.exists) {
          var data = documentSnapshot.data();
          var encodedData = jsonEncode(data);
          // encodedData.
          fetchedUser = UserModel.fromData(jsonDecode(encodedData));
          // for(var userdataDocSnap in userData){
          //
          // }
          // UserModel.fromData(userData.data());

        }
      });

      // userData.data();
      return fetchedUser;
    } catch (e) {
      // TODO: Find or create a way to repeat error handling without so much repeated code
      if (e is PlatformException) {
        return e.message;
      }
      return e.toString();
    }
  }
}
