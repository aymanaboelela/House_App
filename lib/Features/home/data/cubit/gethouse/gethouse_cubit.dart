import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../models/house_model.dart';
part 'gethouse_state.dart';

class GethouseCubit extends Cubit<GethouseState> {
  GethouseCubit() : super(GethouseInitial());

  List data = [];
  Future getData() async {
    emit(IsLodingGetHouse());
    await Future.delayed(const Duration(minutes: 1));
    try {
      QuerySnapshot querySnapshot =
          await FirebaseFirestore.instance.collection('houses').get();

      data.addAll(querySnapshot.docs);

      emit(IsSucssesGetHouse(data: data));
    } on Exception catch (e) {
      emit(IsFeilerGetHouse(error: e.toString()));
    }
  }
}
//   class GethouseCubit extends Cubit<GethouseState> {
//   GethouseCubit() : super(GethouseInitial());

//   List<HouseModel> data = [];

//   Future<void> getData() async {
//     emit(IsLodingGetHouse());
//     print("Data is loading...");
//     try {
//       final querySnapshot = await FirebaseFirestore.instance.collection('houses').get();
//       data = querySnapshot.docs.map((doc) => HouseModel.fromMap(doc.data())).toList();
//       print("Data successfully loaded!");
//       emit(IsSucssesGetHouse(data: data));
//     } on Exception catch (e) {
//       print("Data loading failed: $e");
//       emit(IsFeilerGetHouse(error: e.toString()));
//     }
//   }
// }