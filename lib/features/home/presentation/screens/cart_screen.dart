import 'package:e_commrece/features/home/presentation/widgets/custom_appbar_of_cart_and_product_details.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_of_check_or_add_item.dart';
import '../widgets/custom_item_of_product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarOfCartAndProductDetails
          .customAppBarOfCartAndProductDetails(context, "Cart"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.builder(
          itemCount: 20,
          itemBuilder: (context, index) {
            return const CustomItemOfProduct(
              type: false,
            );
          },
        ),
      ),
      bottomNavigationBar: const BottomNavOfCheckOrAddItem(
        title: "Check Out",
        price: 0,
      ),
    );
  }
}
