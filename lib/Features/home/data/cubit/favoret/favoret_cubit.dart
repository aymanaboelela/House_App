import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../shered_preferences/shared_preferences.dart';

part 'favoret_state.dart';

class FavoretCubit extends Cubit<FavoretState> {
  bool isfavorite = false;
  FavoretCubit() : super(FavoretInitial());
// favoret in single product view
  void setData(bool favorite) {
    CacheData.setData(
      key: "isFavoret",
      value: favorite,
    );
    print("***isFavoret***** $favorite,");
    emit(FavoretChenge());
  }

  Future<void> getData() async {
    await CacheData.getdata(key: "isFavoret");
    print("***********");
    emit(GetDataState());
  }

// favoret in home product view
  bool isfavoriteProduct = true;
  void setDataProduct() {
    CacheData.setData(
      key: "isfavoretproduct",
      value: isfavoriteProduct,
    );
    isfavoriteProduct = !isfavoriteProduct;

    emit(FavoretChengeProduct());
  }

  Future<void> getDataProduct() async {
    emit(FavoretCachProuduct());
    bool cachedFavorite =
        await CacheData.getdata(key: "isfavoretproduct") ?? true;
    isfavoriteProduct = cachedFavorite;
  }
}
