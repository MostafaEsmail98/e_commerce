import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_appbar_of_cart_and_product_details.dart';
import 'package:flutter/material.dart';
import '../widgets/bottom_nav_of_check_or_add_item.dart';
import '../widgets/custom_carousel_of_product.dart';
import '../widgets/custom_details_of_item.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbarOfCartAndProductDetails
          .customAppBarOfCartAndProductDetails(context, "Product Details"),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              CustomCarouselOfProduct(),
              CustomSpaceHeight(height: .02),
              CustomDetailsOfItem(),
            ],
          ),
        ),
      ),
      bottomNavigationBar:const BottomNavOfCheckOrAddItem(title: "Add to Cart",) ,
    );
  }
}
