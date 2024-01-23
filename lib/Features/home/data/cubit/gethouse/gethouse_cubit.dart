import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/house_model.dart';
part 'gethouse_state.dart';

class GethouseCubit extends Cubit<GethouseState> {
  GethouseCubit() : super(GethouseInitial());
  List<HouseModel> data = [];

  Future<void> getData() async {
    data.clear();
    //  await Future.delayed(const Duration(minutes: 1));
    try {
      emit(IsLodingGetHouse());
      print("Data is loading...");
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('houses').get();
      querySnapshot.docs.forEach((doc) {
        HouseModel house =
            HouseModel.fromMap(doc.data() as Map<String, dynamic>);
        data.add(house);
      });
      emit(IsSucssesGetHouse(data: data));
      print("get data...");
    } catch (e) {
      print("Data loading failed: $e");
      emit(IsFeilerGetHouse(error: e.toString()));
    }
  }

  // void deletHouse(int index) async {
  //   await FirebaseFirestore.instance
  //       .collection('houses')
  //       .doc(data[index].id)
  //       .delete();
  // }
}
