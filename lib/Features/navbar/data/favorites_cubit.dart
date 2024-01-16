
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesCubit extends Cubit<List<bool>> {
  FavoritesCubit() : super(List.generate(10, (index) => false));

  void toggleFavorite(int index) {
    state[index] = !state[index];
    emit(List.from(state));
  }
}
