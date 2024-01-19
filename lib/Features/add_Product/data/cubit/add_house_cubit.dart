import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'add_house_state.dart';

class AddHouseCubit extends Cubit<AddHouseState> {
  AddHouseCubit() : super(AddHouseInitial());



 Future<void> addHouse(
    String typeHouse,
    String gender,
    String prise,
    String numberOfRooms,
    String numberOfBeds,
    String description,
    bool hasAirConditioner,
    bool hasWifi,
    bool hasNaturalGas,
  ) async {
    try {
      
  CollectionReference houses = FirebaseFirestore.instance.collection('users');
      await houses.add({
        'Type House': typeHouse,
        'Gender': gender,
        'Prise': prise,
        'Numpers Of Rome': numberOfRooms,
        'Numpers of Bad': numberOfBeds,
        'Description': description,
        'Air Conditioner': hasAirConditioner,
        'Wi-Fi': hasWifi,
        'Natural Gas': hasNaturalGas,
      });

      print("House added successfully");
    } catch (e) {
      print("Failed to add house: $e");
    }
  }
}
  
