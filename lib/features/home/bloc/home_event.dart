part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class NavigatingToWishlistScreen extends HomeEvent {}

class NavigatingToCartScreen extends HomeEvent {}

class WishlistButtonClicked extends HomeEvent {}

class CartButtonClicked extends HomeEvent {}
