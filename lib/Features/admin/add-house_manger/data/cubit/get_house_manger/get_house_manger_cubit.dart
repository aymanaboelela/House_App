import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:house_app_one/Features/admin/add-house_manger/data/models/get_house_mangers_model/get_house_mangers_model.dart';
import 'package:meta/meta.dart';

part 'get_house_manger_state.dart';

class GetHouseMangerCubit extends Cubit<GetHouseMangerState> {
  GetHouseMangerCubit() : super(GetHouseMangerInitial());
  List<HouseMangerModel> data = [];

  Future<void> getData() async {
    data.clear();
    try {
      emit(IsLodingGetHouseManger());
      print(" house Manger is loading...");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('houses manger')
          .orderBy('Date', descending: true)
          .get();
      querySnapshot.docs.forEach((doc) {
        HouseMangerModel house = HouseMangerModel.fromMap(
            doc.id, doc.data() as Map<String, dynamic>);
        data.add(house);
      });
      emit(IsSucssesGetHouseMager(data: data));
      print("Get house Manger");
    } catch (e) {
      print("Get house Mangeris failed: $e");
      emit(IsFeilerGetHouseManger(error: e.toString()));
    }
  }

  Future<void> searchHouseMangerById(String houseMangerId) async {
    data.clear();
    try {
      emit(IsLodingGetHouseManger());
      print("Data is loading...");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('houses manger')
          .where('id House', isEqualTo: houseMangerId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        List<HouseMangerModel> matchingHouseMangers = [];
        querySnapshot.docs.forEach((doc) {
          HouseMangerModel house = HouseMangerModel.fromMap(
              doc.id, doc.data() as Map<String, dynamic>);
          matchingHouseMangers.add(house);
        });

        emit(IsSucssesGetHouseMager(data: matchingHouseMangers));
        print("HouseMangers found for ID: $houseMangerId");
      } else {
        print("No HouseMangers found for ID: $houseMangerId");
        emit(IsFeilerGetHouseManger(error: "No HouseMangers found"));
      }
    } catch (e) {
      print("Data search failed: $e");
      emit(IsFeilerGetHouseManger(error: e.toString()));
    }
  }
}
