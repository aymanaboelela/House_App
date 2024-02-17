import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'filters_state.dart';

class FiltersCubit extends Cubit<FiltersState> {
  FiltersCubit() : super(FiltersInitial());

  bool isMaleSelected = false;
  bool isFemaleSelected = false;
  void chingeGenderBoyes() {
    isMaleSelected = !isMaleSelected;
    isFemaleSelected = !isMaleSelected;
    emit(FilterChingeUi());
  }
  bool ishouseSelected = false;
  bool isStudioelected = false;
  void chingetyphouse() {
    ishouseSelected = !ishouseSelected;
    isStudioelected = !ishouseSelected;
    emit(FilterChingeUi());
  }


}
