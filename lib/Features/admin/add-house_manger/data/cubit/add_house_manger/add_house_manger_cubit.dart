import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';
part 'add_house_manger_state.dart';

class AddHouseMangerCubit extends Cubit<AddHouseMangerState> {
  AddHouseMangerCubit() : super(AddHouseMangerInitial());

  List<XFile> imagesFiles = [];
  List imageNames = [];
  List<String> imageUrls = [];
  String? url;
  Future<void> AddHouseManger({
    required String idHouse,
    required String name,
    required String phoneNumber,
    required String nameOfUniversity,
    required String ground,
    required String addrese,
  }) async {
    emit(IsLodingAddHouseManger());
    if (imagesFiles.isEmpty) {
      emit(IamgeFeiler());
    } else {
      try {
        await addImages();
        await Firebase.initializeApp();
        CollectionReference houses =
            FirebaseFirestore.instance.collection('houses manger');

        await houses.add(
          {
            'id House': idHouse,
            'name manger': name,
            'phoneNumber': phoneNumber,
            'name of university': nameOfUniversity,
            'ground house': ground,
            'addrese house': addrese,
            'Urls': imageUrls,
            'Date': FieldValue.serverTimestamp(),
          },
        );
        print("House added successfully");
        imagesFiles.clear();
        imageNames.clear();
        imageUrls.clear();

        emit(IsSucssesAddHousemanger());
      } catch (e) {
        if (e is FirebaseException) {
          emit(IsFeilerAddHousemanger(error: e.toString()));
        } else {
          emit(IsFeilerAddHousemanger(error: 'An unknown error occurred.'));
        }
      }
    }
  }

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
      emit(ChingeUiAddHousemanger());
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
      emit(ChingeUiAddHousemanger());
    } catch (e) {
      print('Error uploading images: $e');
    }
  }
}
