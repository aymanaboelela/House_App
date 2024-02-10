part of 'add_house_manger_cubit.dart';

@immutable
abstract class AddHouseMangerState {}

class AddHouseMangerInitial extends AddHouseMangerState {}

class IsSucssesAddHousemanger extends AddHouseMangerState {}

class IsLodingAddHouseManger extends AddHouseMangerState {}

class ChingeUiAddHousemanger extends AddHouseMangerState {}
class IamgeFeiler extends AddHouseMangerState {}

class IsFeilerAddHousemanger extends AddHouseMangerState {
  IsFeilerAddHousemanger({required this.error}) : super();
  final String error;
}