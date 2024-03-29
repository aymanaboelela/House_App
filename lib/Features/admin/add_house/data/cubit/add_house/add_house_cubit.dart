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
  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  bool isApartmentSelected = false;
  bool isStudioSelected = false;

  Future<void> addHouse({
    required String idHouse,
    required String typeHouse,
    required String gender,
    required String price,
    required String nameOfUniversity,
    required String numberOfRooms,
    required String numberOfBeds,
    required String description,
    required bool airConditioner,
    required bool wifi,
    required bool singelRome,
    required bool naturalGas,
  }) async {
    emit(IsLodingAddHouse());
    if (imagesFiles.isEmpty) {
      emit(IamgeFeiler());
    } else {
      try {
        await addImages();
        await Firebase.initializeApp();
        CollectionReference houses =
            FirebaseFirestore.instance.collection('houses');

        await houses.add(
          {
            'id House': idHouse,
            'Type House': typeHouse,
            'Gender': gender,
            'Price': price,
            'Name Of University': nameOfUniversity,
            'Number Of Rooms': numberOfRooms,
            'Number Of Beds': numberOfBeds,
            'Description': description,
            'Air Conditioner': airConditioner,
            'Wi-Fi': wifi,
            'Rome Singel': singelRome,
            'Natural Gas': naturalGas,
            'Urls': imageUrls,
            'Date': FieldValue.serverTimestamp(),
          },
        );
        print("House added successfully");
        imagesFiles.clear();
        imageNames.clear();
        imageUrls.clear();

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

  List<XFile> imagesFiles = [];
  List imageNames = [];
  List<String> imageUrls = [];
  String? url;
  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImages() async {
    try {
      final List<XFile>? pickedFiles = await imagePicker.pickMultiImage();
      if (pickedFiles != null && pickedFiles.isNotEmpty) {
        imagesFiles.addAll(pickedFiles);
        for (XFile pickedFile in pickedFiles) {
          imageNames.add(basename(pickedFile.path));
        }
      }
      emit(ChingeUiAddHouse());
    } catch (e) {
      print('Error picking images: $e');
    }
  }

  Future<void> addImages() async {
    try {
      imageUrls.clear();
      for (int i = 0; i < imagesFiles.length; i++) {
        File file = File(imagesFiles[i].path);
        var refStorage =
            FirebaseStorage.instance.ref().child('images/${imageNames[i]}');
        await refStorage.putFile(file);
        url = await refStorage.getDownloadURL();
        imageUrls.add(url!);
      }
      emit(ChingeUiAddHouse());
    } catch (e) {
      print('Error uploading images: $e');
    }
  }
}
