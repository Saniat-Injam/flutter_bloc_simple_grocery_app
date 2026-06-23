import 'package:flutter/material.dart';
import 'package:flutter_bloc_simple_grocery_app/features/home/data/models/product_model.dart';

class ProductTile extends StatelessWidget {
  final ProductModel productModel;
  const ProductTile({super.key, required this.productModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          SizedBox(height: 200, width: double.maxFinite),
          Text(productModel.name ?? ''),
          Text(productModel.description ?? ''),
        ],
      ),
    );
  }
}
