import 'package:flutter/material.dart';
class CartPage extends StatelessWidget {
  final int totalProducts;
  const CartPage({required this.totalProducts,super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Cart"),
      ),
      body: Center(
        child: Text("Total Products : $totalProducts",style: const TextStyle(fontSize: 20)),
      ),
    );
  }
}
