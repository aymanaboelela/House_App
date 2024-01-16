import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../shered_preferences/shared_preferences.dart';

part 'favoret_state.dart';

class FavoretCubit extends Cubit<FavoretState> {
  bool isfavorite = false;
  FavoretCubit() : super(FavoretInitial());
// favoret in single product view
  void setData() {
    CacheData.setData(
      key: "isfavoretandtetels",
      value: isfavorite,
    );
    isfavorite = !isfavorite;

    emit(FavoretChenge());
  }

  Future<void> getData() async {
    bool cachedFavorite =
        await CacheData.getdata(key: "isfavoretandtetels") ?? true;
    isfavorite = cachedFavorite;

    emit(FavoretCach());
  }

// favoret in home product view
  bool isfavoriteProduct = false;
  void setDataProduct() {
    CacheData.setData(
      key: "isfavoretproduct",
      value: isfavoriteProduct,
    );
    isfavoriteProduct = !isfavoriteProduct;

    emit(FavoretChengeProduct());
  }

  Future<void> getDataProduct() async {
    bool cachedFavorite =
        await CacheData.getdata(key: "isfavoretproduct") ?? true;
    isfavoriteProduct = cachedFavorite;

    emit(FavoretCachProuduct());
  }
}
