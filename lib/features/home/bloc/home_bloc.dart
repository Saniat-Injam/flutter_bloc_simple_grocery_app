import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/models/product_model.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
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
    emit(LoadedSuccessState());
  }

  FutureOr<void> navigateToWishlistScreenEvent(
    NavigateToWishlistScreenEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Navigated to the wishlist screen');
    emit(NavigatingToWishlistScreenActionState());
  }

  FutureOr<void> navigateToCartScreenEvent(
    NavigateToCartScreenEvent event,
    Emitter<HomeState> emit,
  ) {
    print('Navigated to the cart screen');
    emit(NavigatingToCartScreenActionState());
  }
}
