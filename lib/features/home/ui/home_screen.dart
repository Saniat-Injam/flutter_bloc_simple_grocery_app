import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/cart_screen/ui/cart_screen.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/wishlist_screen/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      bloc: homeBloc,
      listenWhen: (previous, current) => current is HomeActionState,
      buildWhen: (previous, current) => current is! HomeActionState,

      listener: (context, state) {
        if (state is NavigatingToCartScreenActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return CartScreen();
              },
            ),
          );
        } else if (state is! NavigatingToCartScreenActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return WishlistScreen();
              },
            ),
          );
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.teal,
            title: Text('Simple grocery app'),
            centerTitle: true,
            actions: [
              IconButton(
                onPressed: () {
                  homeBloc.add(NavigatingToWishlistScreen());
                },
                icon: Icon(Icons.favorite_outline),
              ),
              IconButton(
                onPressed: () {
                  homeBloc.add(NavigatingToCartScreen());
                },
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
        );
      },
    );
  }
}
