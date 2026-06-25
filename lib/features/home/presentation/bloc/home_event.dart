part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class HomeScreenInitialEvent extends HomeEvent {
  
}

class WishlistButtonClickedEvent extends HomeEvent {
  final ProductModel clickedProduct;

  WishlistButtonClickedEvent({required this.clickedProduct});

 
}

class CartButtonClickedEvent extends HomeEvent {
    final ProductModel clickedProduct;

  CartButtonClickedEvent({required this.clickedProduct});

}

class NavigateToWishlistScreenEvent extends HomeEvent {}

class NavigateToCartScreenEvent extends HomeEvent {}
