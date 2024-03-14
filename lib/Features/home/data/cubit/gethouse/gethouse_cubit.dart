import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../models/house_model.dart';
part 'gethouse_state.dart';

class GethouseCubit extends Cubit<GethouseState> {
  GethouseCubit() : super(GethouseInitial());
  List<HouseModel> data = [];

  Future<void> getData() async {
    data.clear();
    emit(IsLodingGetHouse());
    try {
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
      emit(IsSuccessGetHouse(data: data));
      print("get data...");
    } catch (e) {
      print("Data is failed: $e");
      emit(IsFailureGetHouse(error: e.toString()));
    }
  }

  List<HouseModel> dataIsFavorite = [];
  Future<void> getFavoriteData({required String token}) async {
    dataIsFavorite.clear();
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('isFavoritehouses')
          .doc(token)
          .collection('isFavorite')
          .get();
      if (querySnapshot.docs.isEmpty) {
        emit(IsDataIsEmptyFavorite());
      } else {
        querySnapshot.docs.forEach(
          (doc) {
            HouseModel houseFavorite =
                HouseModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
            dataIsFavorite.add(houseFavorite);
          },
        );

        print("Data retrieved successfully: $dataIsFavorite");
        emit(IsSuccessGetHouseFavorite(data: dataIsFavorite));
      }
    } catch (e) {
      print("Failed to fetch data: $e");
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
      querySnapshot.docs.forEach(
        (doc) {
          HouseModel house =
              HouseModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
          data.add(house);
        },
      );
      if (data.isEmpty) {
        emit(IsDataIsEmptyGetHouse(data: data));
      }

      emit(IsSuccessGetHouse(data: data));
      print("get data is $gender..");
    } catch (e) {
      print("Data is failed: $e");
      emit(IsFailureGetHouse(error: e.toString()));
    }
  }

  Future<void> getDataTypHouse(
    String typHouse,
  ) async {
    data.clear();
    try {
      emit(IsLodingGetHouse());
      print("Data is loading...");

      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('houses')
          .where('Type House', isEqualTo: typHouse)
          .get();
      querySnapshot.docs.forEach(
        (doc) {
          HouseModel house =
              HouseModel.fromMap(doc.id, doc.data() as Map<String, dynamic>);
          data.add(house);
        },
      );
      if (data.isEmpty) {
        emit(IsDataIsEmptyGetHouse(data: data));
      }
      emit(IsSuccessGetHouse(data: data));
      print("get data is $typHouse..");
    } catch (e) {
      print("Data is failed: $e");
      emit(IsFailureGetHouse(error: e.toString()));
    }
  }

  // الوظيفة المعدلة لتحديث نتائج البحث
  Future<void> searchHouseById(String houseId) async {
    data.clear();
    try {
      emit(IsLodingGetHouse());
      print("Data is loading...");
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('houses')
          .where('id House', isEqualTo: houseId)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        HouseModel house = HouseModel.fromMap(querySnapshot.docs[0].id,
            querySnapshot.docs[0].data() as Map<String, dynamic>);
        data.add(house);
        emit(IsSuccessGetHouse(data: data));
        print("House found: $houseId");
      } else {
        print("House not found: $houseId");
        emit(IsFailureGetHouse(error: "House not found"));
      }
    } catch (e) {
      print("Data search failed: $e");
      emit(IsFailureGetHouse(error: e.toString()));
    }
  }

  void deleteHouse(int index) async {
    try {
      String documentId = data[index].id;
      await FirebaseFirestore.instance
          .collection('houses')
          .doc(documentId)
          .delete();
      print('House deleted successfully');
    } catch (e) {
      print('Error deleting house: $e');
    }
  }

  void updateHouse(int index, Map<String, dynamic> newData) async {
    try {
      emit(IsLodingEditHouse());
      String documentId = data[index].id;
      await FirebaseFirestore.instance
          .collection('houses')
          .doc(documentId)
          .set(newData);
      SetOptions(merge: true);
      emit(IsSucssesEditHouse());
    } catch (e) {
      emit(
        IsFeilerEditHouse(
          error: e.toString(),
        ),
      );
    }
  }
}
