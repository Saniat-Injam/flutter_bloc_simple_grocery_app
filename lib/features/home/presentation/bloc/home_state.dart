part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}


// Build State -- that build the ui
final class HomeInitialstate extends HomeState {}

final class LoadingState extends HomeState {}

final class LoadedSuccessState extends HomeState {
  final List<ProductModel>? products;
  LoadedSuccessState({this.products});
}

final class ErrorState extends HomeState {}


// Actionable State
final class NavigatingToWishlistScreenActionState extends HomeActionState {}

final class NavigatingToCartScreenActionState extends HomeActionState {}

final class ItemAddedToWishlistActionState extends HomeActionState {}
final class ItemAddedToCartActionState extends HomeActionState {}
