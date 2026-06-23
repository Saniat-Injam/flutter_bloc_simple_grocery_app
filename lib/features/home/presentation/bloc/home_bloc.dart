import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/data/data_sources/grocery_data.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/data/models/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeScreenInitialEvent()) {
    on<HomeScreenInitialEvent>(homeScreenInitialEvent);
    on<NavigateToWishlistScreenEvent>(navigateToWishlistScreenEvent);
    on<NavigateToCartScreenEvent>(navigateToCartScreenEvent);
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
}
