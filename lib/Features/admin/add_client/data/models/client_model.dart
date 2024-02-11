import 'package:cloud_firestore/cloud_firestore.dart';

class clientModel {
  final String? id;
  final String? idHouse;
  final String? nameclient;
  final String? phoneNumber;
  final String? nameOfUniversity;
  final String? price;

  final List<dynamic> imageUrl;
  final Timestamp? date;

  clientModel({
    required this.id,
    required this.idHouse,
    required this.nameclient,
    required this.phoneNumber,
    required this.nameOfUniversity,
    required this.price,
    required this.imageUrl,
    required this.date,
  });

  factory clientModel.fromMap(String id, Map<String, dynamic> data) {
    return clientModel(
      id: id,
      idHouse: data['id House'],
      nameclient: data['name'],
      phoneNumber: data['phone Number'],
      nameOfUniversity: data['name Of University'],
      price: data['Price'],
      imageUrl: data["Url"],
      date: data['Date'],
    );
  }
}
