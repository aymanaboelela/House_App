import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/house_model.dart';
import '../../../../../core/shered_preferences/shared_preferences.dart';
part 'Favorite_state.dart';

class FavoriteCubit extends Cubit<FavoretState> {
  FavoriteCubit() : super(FavoretInitial());

  Future<void> addProductInFavoriteView(
      HouseModel data, bool isFavorite,) async {
    await CacheData.setData(
      key: data.id,
      value: isFavorite,
    );

    isFavorite = FavoriteProducts.products.contains(data);
    if (isFavorite) {
      FavoriteProducts.products.remove(data);
    } else {
      FavoriteProducts.products.add(data);
    }
    emit(FavoretChenge());
  }

  Future<void> getData(String id) async {
    await CacheData.getdata(key: id) ?? false;
    emit(GetDataState());
  }
}
class FavoriteProducts {
  static List<HouseModel> products = [];
}
