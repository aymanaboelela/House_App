import 'package:cloud_firestore/cloud_firestore.dart';

class HouseMangerModel {
  final String? id;
  final String? idHouse;
  final String? nameManger;
  final String? phoneNumber;
  final String? nameOfUniversity;
  final String? groundHouse;
  final String? addreseHouse;
  final List<String>? imageUrls;
  final Timestamp? date;

  HouseMangerModel({
    required this.id,
    required this.idHouse,
    required this.nameManger,
    required this.phoneNumber,
    required this.nameOfUniversity,
    required this.groundHouse,
    required this.addreseHouse,
    required this.imageUrls,
    required this.date,
  });

  factory HouseMangerModel.fromMap(String id, Map<String, dynamic> data) {
    return HouseMangerModel(
      id: id,
      idHouse: data['id House'],
      nameManger: data['name manger'],
      phoneNumber: data['phoneNumber'],
      nameOfUniversity: data['name of university'],
      groundHouse: data['ground house'],
      addreseHouse: data['addrese house'],
      imageUrls: List<String>.from(data['Urls']),
      date: data['Date'],
    );
  }


 

 
}
