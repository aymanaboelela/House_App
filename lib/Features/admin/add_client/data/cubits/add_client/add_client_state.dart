part of 'add_client_cubit.dart';

@immutable
abstract class AddClientState {}

class AddClientInitial extends AddClientState {}


class IsSucssesAddClient extends AddClientState {}

class IsLodingAddClient extends AddClientState {}

class ChingeUiAddClient extends AddClientState {}
class IamgeFeiler extends AddClientState {}

class IsFeilerAddClient extends AddClientState {
  IsFeilerAddClient({required this.error}) : super();
  final String error;
}
