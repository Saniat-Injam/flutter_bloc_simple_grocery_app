part of 'cart_bloc.dart';

@immutable
sealed class CartEvent {}

class CartInitialEvent extends CartEvent {}

class RemoveItemFromCart extends CartEvent {
  final ProductModel productModel;

  RemoveItemFromCart(this.productModel);
  
}
