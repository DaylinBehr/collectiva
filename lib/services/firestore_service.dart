import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collectiva/models/item_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import '../models/user_model.dart';

class FireStoreService {
  final CollectionReference _issuesCollectionReference =
      FirebaseFirestore.instance.collection('issues');
  final CollectionReference _usersCollectionReference =
      FirebaseFirestore.instance.collection('users');
  // Stream<List<Issue>> fetchLiveUserPosts( {required UserModel user}) async* {
  // final Stream<QuerySnapshot> _userPostedIssuesStream = _issuesCollectionReference.doc(user.id).collection('submissions').snapshots();

  // }
  Future getPostedCollections(UserModel? user) async {
    try {
      var issueDocumentSnapshot = await _issuesCollectionReference
          .doc(user?.id)
          .collection('submissions').where('UserDeleted', isEqualTo: false).orderBy('DateLogged', descending: true)
          .get();
      if (issueDocumentSnapshot.docs.isNotEmpty) {
        return issueDocumentSnapshot.docs.map((snapshot) => Item.fromDataMap(snapshot.data()))
            // .where((mappedItem) => mappedItem?.nam != null)
            .toList();
      }
    } catch (err) {
      if (err is PlatformException) {
        return err.message;
      }

      return err.toString();
    }
  }

  Future deletePostedCollection(String queryID, UserModel? user)async {
    try{
      await _issuesCollectionReference
          .doc(user?.id)
          .collection('submissions').doc(queryID).update({'UserDeleted': true});
    }catch(err){
      if (err is PlatformException) {
        return err.message;
      }

      return err.toString();
    }
  }

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

  Future<bool> userExists(User? currUser) async {
    DocumentReference userExists = _usersCollectionReference.doc(currUser!.uid);
    var data = await userExists.get();
    return data.exists;
  }

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
