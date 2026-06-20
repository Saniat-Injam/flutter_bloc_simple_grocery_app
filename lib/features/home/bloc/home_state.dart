part of 'home_bloc.dart';

@immutable
sealed class HomeState {}
sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class LoadingState extends HomeState {}
final class SuccessState extends HomeState {}
final class ErrorState extends HomeState {} 

final class NavigatingToWishlistScreenActionState extends HomeActionState {}
final class NavigatingToCartScreenActionState extends HomeActionState {}


