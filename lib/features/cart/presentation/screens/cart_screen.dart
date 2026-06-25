import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/cart/presentation/widgets/cart_tile.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => CartScreenState();
}

class CartScreenState extends State<CartScreen> {
  final CartBloc cartBloc = CartBloc();
  @override
  void initState() {
    cartBloc.add(CartInitialEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Car items')),
      body: BlocConsumer<CartBloc, CartState>(
        bloc: cartBloc,
        listenWhen: (previous, current) => current is CartActionState,
        buildWhen: (previous, current) => current is! CartActionState,
        listener: (context, state) {},
        builder: (context, state) {
          switch (state.runtimeType) {
            case const (SuccessState):
              final successState = state as SuccessState;
              return ListView.builder(
                itemCount: successState.cartItems.length,
                itemBuilder: (BuildContext context, int index) {
                  return CartTile(
                    cartBloc: cartBloc,
                    productModel: successState.cartItems[index],
                  );
                },
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
