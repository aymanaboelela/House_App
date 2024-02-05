import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/house_model.dart';
import '../../../../../core/shered_preferences/shared_preferences.dart';
part 'Favorite_state.dart';

class FavoriteCubit extends Cubit<FavoretState> {
  FavoriteCubit() : super(FavoretInitial());

  bool isFavorite = false;

  void addProductInFavoriteView(HouseModel data) {
    isFavorite = FavoriteProducts.products.contains(data);
    if (isFavorite) {
      FavoriteProducts.products.remove(data);
    } else {
      FavoriteProducts.products.add(data);
    }
    isFavorite = !isFavorite;
    emit(FavoretChenge());
  }

  void setData() {
    CacheData.setData(
      key: "isFavorite",
      value: isFavorite,
    );
    emit(SetDataState());
    print("***set data isFavorite***** $isFavorite");
  }

  Future<void> getData() async {
    await CacheData.getdata(key: "isFavorite");
    print("***** get data is favorite******  ${await CacheData.getdata(key: "isFavoret")}");

    emit(GetDataState());
  }
}

class FavoriteProducts {
  static List<HouseModel> products = [];
}
