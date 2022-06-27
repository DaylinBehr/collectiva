import 'package:cloud_firestore/cloud_firestore.dart';

class ItemModel {
  String? id;
  String? name;
  String? description;
  String? image;
  String? quantity;
  Timestamp? addDate;
  Timestamp? createdOn;
  List<Map<String?, String?>>? fields;

  ItemModel({
    this.id ="",
   required this.name,
    required this.description,
    required this.image,
    required this.quantity,
    required this.addDate,
    required this.createdOn,
    required this.fields,
  });

  factory ItemModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return ItemModel(
      id: data?['id'],
      name: data?['name'],
      description: data?['description'],
      image: data?['image'],
      quantity: data?['quantity'],
      addDate: data?['addDate'],
      createdOn: data?['createdOn'],
      fields: data?['fields'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (name != null) "name": name,
      if (description != null) "description": description,
      if (image != null) "image": image,
      if (quantity != null) "quantity": quantity,
      if (addDate != null) "addDate": addDate,
      if (createdOn != null) "createdOn": createdOn,
      if (fields != null) "fields": fields,
    };
  }
}
