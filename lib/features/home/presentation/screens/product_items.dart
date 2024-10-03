import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';

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
            Expanded(
                child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 1 / 1.3,
                  crossAxisSpacing: 12,
                  mainAxisSpacing: 8,
                  crossAxisCount: 2),
              itemBuilder: (context, index) {
                return const CustomProductItem();
              },
            ))
          ],
        ),
      ),
    );
  }
}
