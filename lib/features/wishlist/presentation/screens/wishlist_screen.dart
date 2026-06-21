import 'package:flutter/material.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});
  @override
  // ignore: no_logic_in_create_state
  State<WishlistScreen> createState() {
    return WishlistScreenState();
  }
}

class WishlistScreenState extends State<WishlistScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Wishlist Screen')));
  }
}
