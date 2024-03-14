import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../models/house_model.dart';
import '../../../../../core/shered_preferences/shared_preferences.dart';
part 'Favorite_state.dart';

class FavoriteCubit extends Cubit<FavoretState> {
  FavoriteCubit() : super(FavoretInitial());
  Future<void> addProductInFavoriteView(
      HouseModel data, bool isFavorite, String token) async {
    await CacheData.setData(
      key: data.id,
      value: isFavorite,
    );
    emit(FavoretChenge());
    if (!isFavorite) {
      await FirebaseFirestore.instance
          .collection('isFavoritehouses')
          .doc(token)
          .collection('isFavorite')
          .doc(data.id)
          .delete();
    } else {
      await FirebaseFirestore.instance
          .collection('isFavoritehouses')
          .doc(token)
          .collection('isFavorite')
          .doc(data.id)
          .set(
        {
          'id House': data.idHouse,
          'Type House': data.typeHouse,
          'Number Of Rooms': data.numpersOfRoms,
          'Price': data.price,
          'Name Of University': data.nameOfUniversity,
          'Air Conditioner': data.airConditioner,
          'Wi-Fi': data.wifi,
          'Rome Singel': data.singelRome,
          'Natural Gas': data.naturalgas,
          'Description': data.description,
          'Gender': data.gender,
          'Number Of Beds': data.numpersOfBad,
          'Urls': data.url,
        },
      );
      SetOptions(merge: true);
    }
  }
}
