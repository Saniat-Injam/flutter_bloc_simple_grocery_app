part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeScreenInitialEvent extends HomeEvent {

}

class NavigateToWishlistScreenEvent extends HomeEvent {}

class NavigateToCartScreenEvent extends HomeEvent {}

class WishlistButtonClickedEvent extends HomeEvent {}

class CartButtonClickedEvent extends HomeEvent {}
