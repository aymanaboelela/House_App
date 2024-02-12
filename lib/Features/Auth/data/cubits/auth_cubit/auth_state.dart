part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthSucceed extends AuthState {}

class AuthLoding extends AuthState {}

class AuthFlid extends AuthState {
  final String error;

  AuthFlid({required this.error});
}

class AuthUserFound extends AuthState {
  final String error;

  AuthUserFound({required this.error});
}

class AuthWrongPassword extends AuthState {
  final String error;

  AuthWrongPassword({required this.error});
}
