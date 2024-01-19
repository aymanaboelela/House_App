import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'add_house_state.dart';

class AddHouseCubit extends Cubit<AddHouseState> {
  AddHouseCubit() : super(AddHouseInitial());
  bool isMaleSelected = true;
  bool isFemaleSelected = false;
  bool isapartmentSelected = true;
  bool isStudioSelected = false;
  bool isChecked = false;

  Future<void> addHouse({
    required String typeHouse,
    required String gender,
    required String prise,
    required String numberOfRooms,
    required String numberOfBeds,
    required String description,
    required String airConditioner,
    required String wifi,
    required String naturalGas,
  }) async {
    emit(IsLodingAddHouse());
    try {
      CollectionReference houses =
          FirebaseFirestore.instance.collection('users');
      await houses.add({
        'Type House': typeHouse,
        'Gender': gender,
        'Prise': prise,
        'Numpers Of Rome': numberOfRooms,
        'Numpers of Bad': numberOfBeds,
        'Description': description,
        'Air Conditioner': airConditioner,
        'Wi-Fi': wifi,
        'Natural Gas': naturalGas,
      });
      print("House added successfully");
      emit(IsSucssesAddHouse());
    } catch (e) {
      emit(IsFeilerAddHouse(error: e.toString()));
    }
  }

  void houseSelected() {
    isapartmentSelected = !isapartmentSelected;
    isStudioSelected = !isStudioSelected;
    emit(ChingeUiAddHouse());
  }

  void houseSelected2() {
    isStudioSelected = !isStudioSelected;
    isapartmentSelected = !isapartmentSelected;

    emit(ChingeUiAddHouse());
  }

  void chingeGengerBoyes() {
    isMaleSelected = !isMaleSelected;
    isFemaleSelected = !isMaleSelected;

    emit(ChingeUiAddHouse());
  }

  void chingeGengergirls() {
    isFemaleSelected = !isFemaleSelected;
    isMaleSelected = !isFemaleSelected;

    emit(ChingeUiAddHouse());
  }

  void pickImage() async {
    await ImagePicker().pickImage(source: ImageSource.gallery);
    emit(ChingeUiAddHouse());
  }
}
