import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
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
