part of 'gethouse_cubit.dart';

@immutable
abstract class GethouseState {}

class GethouseInitial extends GethouseState {}

class IsSucssesGetHouse extends GethouseState {
    final List<HouseModel>  data;

  IsSucssesGetHouse({required this.data});
}

class IsLodingGetHouse extends GethouseState {

}

class IsFeilerGetHouse extends GethouseState {
  IsFeilerGetHouse({required this.error}) : super();
  final String error;
}