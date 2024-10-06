import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            const CustomLogoAndSearch(),
            const CustomSpaceHeight(height: .01),
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1.3 / 1.5,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 3,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                    onTap: () {
                      GoRouter.of(context).push('/ProductDetails');
                    },
                    child: const CustomProductItem());
              },
            ))
          ],
        ),
      ),
    );
  }
}
