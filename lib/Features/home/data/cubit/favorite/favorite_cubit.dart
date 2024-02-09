import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../models/house_model.dart';
import '../../../../../core/shered_preferences/shared_preferences.dart';
part 'Favorite_state.dart';

class FavoriteCubit extends Cubit<FavoretState> {
  FavoriteCubit() : super(FavoretInitial());

  Future<void> addProductInFavoriteView(
      HouseModel data, bool isFavorite, int index) async {
    await CacheData.setData(
    key: index.toString(),
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

  Future<void> getData(int index) async {
    await CacheData.getdata(key: index.toString()) ?? false;
    emit(GetDataState());
  }
}

class FavoriteProducts {
  static List<HouseModel> products = [];
}


