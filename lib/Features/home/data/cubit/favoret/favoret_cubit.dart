import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/house_model.dart';
import '../../shered_preferences/shared_preferences.dart';

part 'favoret_state.dart';

class FavoretCubit extends Cubit<FavoretState> {
  FavoretCubit() : super(FavoretInitial());

  bool isFavorite = false;

  void addProductInFavoretView(HouseModel data) {
    isFavorite = FavoriteProducts.products.contains(data);
    if (isFavorite) {
      FavoriteProducts.products.remove(data);
    } else {
      FavoriteProducts.products.add(data);
    }
    isFavorite = !isFavorite;
    emit(FavoretChenge());
  }

// favoret in single product view//////////////////////////
  void setData() {
    CacheData.setData(
      key: "isFavoret",
      value: isFavorite,
    );
    print("***isFavoret***** $isFavorite,");
    emit(FavoretChenge());
  }

  Future<void> getData() async {
    await CacheData.getdata(key: "isFavoret");
    print("***********");
    emit(GetDataState());
  }

// favoret in home product view

  void setDataProduct() {
    CacheData.setData(
      key: "isfavoretproduct",
      value: isFavorite,
    );
    isFavorite = !isFavorite;

    emit(FavoretChengeProduct());
  }

  Future<void> getDataProduct() async {
    emit(FavoretCachProuduct());
    bool cachedFavorite =
        await CacheData.getdata(key: "isfavoretproduct") ?? true;
    isFavorite = cachedFavorite;
  }
}

class FavoriteProducts {
  static List<HouseModel> products = [];
}
