import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/cart/data/data_sources/cart_items.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/data/data_sources/grocery_data.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/data/models/product_model.dart';
import 'package:flutter_bloc_simple_grocery_app/features/wishlist/data/data_sources/wishlist_items.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialstate()) {
    on<HomeScreenInitialEvent>(homeScreenInitialEvent);
    on<NavigateToWishlistScreenEvent>(navigateToWishlistScreenEvent);
    on<NavigateToCartScreenEvent>(navigateToCartScreenEvent);
    on<WishlistButtonClickedEvent>(wishlistButtonClickedEvent);
    on<CartButtonClickedEvent>(cartButtonClickedEvent);
  }

  FutureOr<void> homeScreenInitialEvent(
    HomeScreenInitialEvent event,
    Emitter<HomeState> emit,
  ) async {
    emit(LoadingState());
    await Future.delayed(Duration(seconds: 3));
    emit(
      LoadedSuccessState(
        products: GroceryData.groceryProducts.map((e) {
          return ProductModel(
            id: e['id'],
            name: e['name'],
            description: e['description'],
            price: e['price'],
            imageUrl: e['imageUrl'],
          );
        }).toList(),
      ),
    );
  }

  FutureOr<void> navigateToWishlistScreenEvent(
    NavigateToWishlistScreenEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(NavigatingToWishlistScreenActionState());
  }

  FutureOr<void> navigateToCartScreenEvent(
    NavigateToCartScreenEvent event,
    Emitter<HomeState> emit,
  ) {
    emit(NavigatingToCartScreenActionState());
  }

  FutureOr<void> wishlistButtonClickedEvent(
    WishlistButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Wishlist button clicked');
    wishlistItems.add(event.clickedProduct);
    emit(ItemAddedToWishlistActionState());
  }

  FutureOr<void> cartButtonClickedEvent(
    CartButtonClickedEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Cart button clicked event');
    cartItems.add(event.clickedProduct);
    emit(ItemAddedToCartActionState());
  }
}
