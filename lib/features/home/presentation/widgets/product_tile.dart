import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/data/models/product_model.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/presentation/bloc/home_bloc.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  final HomeBloc homeBloc = HomeBloc();
  ProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 200,
            width: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(productModel.imageUrl!),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            productModel.name ?? '',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(productModel.description ?? ""),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                productModel.price?.toString() ?? "",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        WishlistButtonClickedEvent(
                          clickedProduct: productModel,
                        ),
                      );
                    },
                    icon: Icon(Icons.favorite_outline),
                  ),
                  IconButton(
                    onPressed: () {
                      homeBloc.add(
                        CartButtonClickedEvent(clickedProduct: productModel),
                      );
                    },
                    icon: Icon(Icons.shopping_cart),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
