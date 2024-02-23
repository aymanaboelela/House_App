

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit() : super(FiltersInitial());

  bool isMaleSelected = false;
  bool isFemaleSelected = false;

  void chingeGenderBoyes(bool isMale) {
    isMaleSelected = isMale;
    isFemaleSelected = !isMale;
    emit(FilterChingeUi());
  }

  bool ishouseSelected = false;
  bool isStudioelected = false;
  void chingetyphouse(bool isHouse) {
    ishouseSelected = isHouse;
    isStudioelected = !isHouse;
    emit(FilterChingeUi());
  }

  void isGenderIsFalse() {
    isMaleSelected = false;
    isFemaleSelected = false;
  }

  void isTypHouseIsFalse() {
    ishouseSelected = false;
    isStudioelected = false;
  }
}
