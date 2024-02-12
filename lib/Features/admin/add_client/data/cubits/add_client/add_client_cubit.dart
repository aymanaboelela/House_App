import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'add_client_state.dart';

class AddClientCubit extends Cubit<AddClientState> {
  AddClientCubit() : super(AddClientInitial());

  Future<void> addClient({
    required String idHouse,
    required String name,
    required String phoneNumber,
    required String nameOfUniversity,
    required String price,
  }) async {
    emit(IsLodingAddClient());
    if (pickedFile == null) {
      emit(IamgeFeiler());
    } else {
      try {
        await addImage();
        await Firebase.initializeApp();
        CollectionReference houses =
            FirebaseFirestore.instance.collection('client');

        await houses.add(
          {
            'id House': idHouse,
            'name': name,
            'phone Number': phoneNumber,
            'Price': price,
            'name Of University':nameOfUniversity,
            'Url': imageUrls,
            'Date': FieldValue.serverTimestamp(),
          },
        );
        print("House added successfully");

        emit(IsSucssesAddClient());
      } catch (e) {
        if (e is FirebaseException) {
          emit(IsFeilerAddClient(error: e.toString()));
        } else {
          emit(IsFeilerAddClient(error: 'An unknown error occurred.'));
        }
      }
    }
  }

  XFile? pickedFile;
  List<String> imageUrls = [];
  String? url;
  final ImagePicker imagePicker = ImagePicker();

  Future<void> pickImageFromCamera() async {
    try {
      pickedFile = await imagePicker.pickImage(source: ImageSource.camera);
      if (pickedFile != null) {
        await addImage();
      }
    } catch (e) {
      print('Error picking image from camera: $e');
    }
  }

  Future<void> addImage() async {
    try {
      if (pickedFile != null) {
        File file = File(pickedFile!.path);
        var refStorage = FirebaseStorage.instance
            .ref()
            .child('images/image.jpg'); // Specify a fixed filename
        await refStorage.putFile(file);
        url = await refStorage.getDownloadURL();
        imageUrls.clear(); // Clear existing image URLs
        imageUrls.add(url!);
        emit(ChingeUiAddClient());
      }
    } catch (e) {
      print('Error uploading image to Firebase: $e');
    }
  }
}
