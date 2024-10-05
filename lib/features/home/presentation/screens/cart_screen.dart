import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:e_commrece/core/utils/k_colors.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_appbar_of_cart_and_product_details.dart';
import 'package:flutter/material.dart';
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
      bottomNavigationBar: SizedBox(
        height: 60,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Total price",
                    style: AppStyles.textMedium18(context)
                        .copyWith(color: const Color(0xff06004F)),
                  ),
                  Text(
                    "EGP 3000",
                    style: AppStyles.textMedium18(context),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 8.0, bottom: 8.0, right: 32, left: 32),
                  child: Text(
                    "Check Out",
                    style: AppStyles.textMedium20(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
