part of 'get_house_manger_cubit.dart';

@immutable
abstract class GetHouseMangerState {}

class GetHouseMangerInitial extends GetHouseMangerState {}
class GethouseInitial extends GetHouseMangerInitial {}

class IsSucssesGetHouseMager extends GetHouseMangerInitial {
    final List<HouseMangerModel>  data;

  IsSucssesGetHouseMager({required this.data});
}

class IsLodingGetHouseManger extends GetHouseMangerInitial {

}

class IsFeilerGetHouseManger extends GetHouseMangerInitial {
  IsFeilerGetHouseManger({required this.error}) : super();
  final String error;
}