import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_appbar_of_cart_and_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../manager/specific_product_cubit/specific_product_cubit.dart';
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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: BlocBuilder<SpecificProductCubit, SpecificProductState>(
              builder: (context, state) {
                if (state is SpecificProductSuccessful) {
                  return Column(
                    children: [
                      CustomCarouselOfProduct(
                        images: state.specificProductEntity.data!.images!,
                      ),
                      const CustomSpaceHeight(height: .02),
                      CustomDetailsOfItem(
                        specificProductEntity: state.specificProductEntity,
                      ),
                    ],
                  );
                } else if (state is SpecificProductFailure) {
                  return const Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: SizedBox(width: 24, child: Icon(Icons.error)),
                      ));
                } else {
                  return const Center(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(),
                    ),
                  );
                }
              }),
        ),
      ),
      bottomNavigationBar: BlocBuilder<SpecificProductCubit, SpecificProductState>(
        builder: (context, state) {
          if (state is SpecificProductSuccessful){
            return BottomNavOfCheckOrAddItem(
              price:state.specificProductEntity.data!.price!,
              title: "Add to Cart",
            );
          }
          else {
            return const SizedBox() ;
          }

        },
      ),
    );
  }
}
