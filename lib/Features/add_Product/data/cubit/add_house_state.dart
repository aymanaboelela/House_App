part of 'add_house_cubit.dart';

@immutable
abstract class AddHouseState {}

class AddHouseInitial extends AddHouseState {}

class IsSucssesAddHouse extends AddHouseState {}

class IsFeilerAddHouse extends AddHouseState {
  IsFeilerAddHouse({required this.error}) : super();
  final String error;
}
class IsLodingAddHouse extends AddHouseState {}
class ChingeUiAddHouse extends AddHouseState {}
