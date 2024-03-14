part of 'gethouse_cubit.dart';

abstract class GethouseState {}

class GethouseInitial extends GethouseState {}

class IsSuccessGetHouse extends GethouseState {
  final List<HouseModel> data;

  IsSuccessGetHouse({required this.data});
}

class IsLodingGetHouse extends GethouseState {}

class IsDataIsEmptyGetHouse extends GethouseState {
  final List<HouseModel> data;

  IsDataIsEmptyGetHouse({required this.data});
}

class IsFailureGetHouse extends GethouseState {
  IsFailureGetHouse({required this.error}) : super();
  final String error;
}

// ubDate

class IsSucssesEditHouse extends GethouseState {}

class IsLodingEditHouse extends GethouseState {}

class IsFeilerEditHouse extends GethouseState {
  IsFeilerEditHouse({required this.error}) : super();
  final String error;
}

//Favortie
class IsSuccessGetHouseFavorite extends GethouseState {
  final List<HouseModel> data;

  IsSuccessGetHouseFavorite({required this.data});
}

class IsDataIsEmptyFavorite extends GethouseState {}
