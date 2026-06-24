import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/cart/presentation/screens/cart_screen.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/presentation/bloc/home_bloc.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/presentation/widgets/product_tile.dart';
import 'package:flutter_bloc_simple_grocery_app/features/wishlist/presentation/screens/wishlist_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc homeBloc = HomeBloc();

  @override
  void initState() {
    homeBloc.add(HomeScreenInitialEvent());
    super.initState();
  }

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
            MaterialPageRoute(builder: (context) => CartScreen()),
          );
        } else if (state is NavigatingToWishlistScreenActionState) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WishlistScreen()),
          );
        } else if (state is ItemAddedToWishlistActionState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text('Item added the wishlist')));
        } else if (state is ItemAddedToCartActionState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Item successfully added to the cart')),
          );
        }
      },

      builder: (context, state) {
        switch (state.runtimeType) {
          case const (LoadingState):
            return Scaffold(body: Center(child: CircularProgressIndicator()));

          case const (LoadedSuccessState):
            final successState = state as LoadedSuccessState;
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.teal,
                title: Text('Simple grocery app'),
                centerTitle: true,
                actions: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(NavigateToWishlistScreenEvent());
                    },
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(NavigateToCartScreenEvent());
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ],
              ),
              body: ListView.builder(
                itemCount: successState.products!.length,
                itemBuilder: (context, index) {
                  return ProductTile(
                    productModel: successState.products![index],
                    homeBloc: homeBloc,
                  );
                },
              ),
            );

          case const (ErrorState):
            return Scaffold(body: Center(child: Text('Error')));
          default:
            return SizedBox();
        }
      },
    );
  }
}
