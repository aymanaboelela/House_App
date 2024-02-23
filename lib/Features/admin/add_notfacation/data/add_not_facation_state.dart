part of 'add_not_facation_cubit.dart';

@immutable
abstract class AddNotFacationState {}

class AddNotFacationInitial extends AddNotFacationState {}

class IsSucssesAddNotFacation extends AddNotFacationState {}

class IsLodingAddAddNotFacation extends AddNotFacationState {}

class IsFeilerAddNotFacation extends AddNotFacationState {
  IsFeilerAddNotFacation({required this.error}) : super();
  final String error;
}
