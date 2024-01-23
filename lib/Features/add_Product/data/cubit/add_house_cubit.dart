import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

part 'add_house_state.dart';

class AddHouseCubit extends Cubit<AddHouseState> {
  AddHouseCubit() : super(AddHouseInitial());
  bool isMaleSelected = true;
  bool isFemaleSelected = false;
  bool isApartmentSelected = true;
  bool isStudioSelected = false;

  File? file;
  var imageName;
  String? url;

  Future<void> addHouse({
    required String idHouse,
    required String typeHouse,
    required String gender,
    required String price,
    required String numberOfRooms,
    required String numberOfBeds,
    required String description,
    required bool airConditioner,
    required bool wifi,
    required bool naturalGas,
  }) async {
    emit(IsLodingAddHouse());
    if (file == null) {
      emit(IamgeFeiler());
    } else {
      try {
        await addImage();
        await Firebase.initializeApp();
        CollectionReference houses =
            FirebaseFirestore.instance.collection('houses');

        await houses.add(
          {
            'id House': idHouse,
            'Type House': typeHouse,
            'Gender': gender,
            'Price': price,
            'Number Of Rooms': numberOfRooms,
            'Number Of Beds': numberOfBeds,
            'Description': description,
            'Air Conditioner': airConditioner,
            'Wi-Fi': wifi,
            'Natural Gas': naturalGas,
            'url': url,
          },
        );
        print("House added successfully");
        emit(IsSucssesAddHouse());
      } catch (e) {
        if (e is FirebaseException) {
          emit(IsFeilerAddHouse(error: e.toString()));
        } else {
          emit(IsFeilerAddHouse(error: 'An unknown error occurred.'));
        }
      }
    }
  }

  void houseSelected() {
    isApartmentSelected = !isApartmentSelected;
    isStudioSelected = !isApartmentSelected;
    emit(ChingeUiAddHouse());
  }

  void houseSelected2() {
    isStudioSelected = !isStudioSelected;
    isApartmentSelected = !isStudioSelected;
    emit(ChingeUiAddHouse());
  }

  void chingeGenderBoyes() {
    isMaleSelected = !isMaleSelected;
    isFemaleSelected = !isMaleSelected;
    emit(ChingeUiAddHouse());
  }

  void chingeGenderGirls() {
    isFemaleSelected = !isFemaleSelected;
    isMaleSelected = !isFemaleSelected;
    emit(ChingeUiAddHouse());
  }

  Future<void> pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        file = File(pickedFile.path);
        imageName = basename(pickedFile.path);
      }
      emit(ChingeUiAddHouse());
    } catch (e) {
      print('Error picking image///////////////////////: $e');
    }
  }

  Future<void> addImage() async {
    var refStorage = FirebaseStorage.instance.ref().child('image/$imageName');
    await refStorage.putFile(file!);
    url = await refStorage.getDownloadURL();
  }
}
