import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<NavigatingToWishlistScreen>(navigatingToWishlistScreen);
    on<NavigatingToCartScreen>(navigatingToCartScreen);
  }

  FutureOr<void> navigatingToWishlistScreen(
    NavigatingToWishlistScreen event,
    Emitter<HomeState> emit,
  ) {
    print('Navigated to the wishlist screen');
    emit(NavigatingToWishlistScreenActionState());
  }

  FutureOr<void> navigatingToCartScreen(
    NavigatingToCartScreen event,
    Emitter<HomeState> emit,
  ) {
    print('Navigated to the cart screen');
    emit(NavigatingToCartScreenActionState());
  }
}
