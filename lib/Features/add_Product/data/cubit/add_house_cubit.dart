import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_house_state.dart';

class AddHouseCubit extends Cubit<AddHouseState> {
  AddHouseCubit() : super(AddHouseInitial());
  bool isMaleSelected = true;
  bool isFemaleSelected = false;
  bool isApartmentSelected = true;
  bool isStudioSelected = false;

  Future<void> addHouse({
    required int id,
    required String typeHouse,
    required String gender,
    required String price,
    required String numberOfRooms,
    required String numberOfBeds,
    required String description,
    required String airConditioner,
    required String wifi,
    required String naturalGas,
  }) async {
    emit(IsLodingAddHouse());
    try {
      await Firebase.initializeApp(); // Initialize Firebase
      CollectionReference houses =
          FirebaseFirestore.instance.collection('houses');
      await houses.add({
        'id':id,
        'Type House': typeHouse,
        'Gender': gender,
        'Price': price,
        'Number Of Rooms': numberOfRooms,
        'Number Of Beds': numberOfBeds,
        'Description': description,
        'Air Conditioner': airConditioner,
        'Wi-Fi': wifi,
        'Natural Gas': naturalGas,
      });
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

  void pickImage() async {
    try {
      final pickedFile =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        // Do something with the picked image (e.g., upload to Firebase Storage)
        // Here, you might want to update your Firestore document with the image URL
      }
      emit(ChingeUiAddHouse());
    } catch (e) {
      // Handle image picking error
      print('Error picking image: $e');
    }
  }
}
