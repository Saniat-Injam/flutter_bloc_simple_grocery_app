import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/cart/data/data_sources/cart_items.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/data/models/product_model.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartInitial()) {
    on<CartInitialEvent>(cartInitialEvent);
    on<RemoveItemFromCart>(removeItemFromCart);
  }

  FutureOr<void> cartInitialEvent(
    CartInitialEvent event,
    Emitter<CartState> emit,
  ) {
    emit(SuccessState(cartItems: cartItems));
  }

  FutureOr<void> removeItemFromCart(
    RemoveItemFromCart event,
    Emitter<CartState> emit,
  ) {
    cartItems.remove(event.productModel);
    emit(SuccessState(cartItems: cartItems));
  }
}
