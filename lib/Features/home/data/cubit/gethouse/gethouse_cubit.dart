import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/house_model.dart';
part 'gethouse_state.dart';

class GethouseCubit extends Cubit<GethouseState> {
  GethouseCubit() : super(GethouseInitial());
  List<HouseModel> data = [];

  Future<void> getData() async {
    data.clear();
    try {
      emit(IsLodingGetHouse());
      print("Data is loading...");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('houses')
          .orderBy('Date', descending: true)
          .get();
      querySnapshot.docs.forEach((doc) {
        HouseModel house =
            HouseModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
        data.add(house);
      });
      emit(IsSucssesGetHouse(data: data));
      print("get data...");
    } catch (e) {
      print("Data is failed: $e");
      emit(IsFeilerGetHouse(error: e.toString()));
    }
  }

  Future<void> getDataGender(String gender) async {
    data.clear();
    try {
      emit(IsLodingGetHouse());
      print("Data is loading...");

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('houses')
          .where('Gender', isEqualTo: gender)
          .get();

      querySnapshot.docs.forEach((doc) {
        HouseModel house =
            HouseModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
        data.add(house);
      });

      emit(IsSucssesGetHouse(data: data));
      print("get data is $gender..");
    } catch (e) {
      print("Data is failed: $e");
      emit(IsFeilerGetHouse(error: e.toString()));
    }
  }

  void deleteHouse(int index) async {
    try {
      String documentId =
          data[index].id; // Assuming data[index] contains the document ID
      await FirebaseFirestore.instance
          .collection('houses')
          .doc(documentId)
          .delete();
      print('House deleted successfully');
    } catch (e) {
      print('Error deleting house: $e');
    }
  }
}
