part of 'favorite_cubit.dart';

@immutable
abstract class FavoretState {}

class FavoretInitial extends FavoretState {}

class FavoretChenge extends FavoretState {}
class SetDataState extends FavoretState {}

class GetDataState extends FavoretState {}

class FavoretChengeProduct extends FavoretState {}

class FavoretCachProuduct extends FavoretState {}
