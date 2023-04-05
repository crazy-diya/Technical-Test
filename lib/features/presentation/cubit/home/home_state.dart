part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadHomeDataSuccessState extends HomeState {
  ProductDetailsEntity productDetailsEntity;

  LoadHomeDataSuccessState({required this.productDetailsEntity});
}

class LoadHomeDataFailState extends HomeState {}
