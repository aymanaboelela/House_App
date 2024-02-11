part of 'get_client_cubit.dart';

@immutable
abstract class GetClientState {}

class GetClientInitial extends GetClientState {}

class IsSucssesGetClient extends GetClientState {
  final List<clientModel> data;

  IsSucssesGetClient({required this.data});
}

class IsLodingGetClient extends GetClientState {}

class IsFeilerGetClient extends GetClientState {
  IsFeilerGetClient({required this.error}) : super();
  final String error;
}
