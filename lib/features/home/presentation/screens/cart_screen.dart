import 'package:e_commrece/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_appbar_of_cart_and_product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widgets/bottom_nav_of_check_or_add_item.dart';
import '../widgets/custom_item_of_product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CartCubit()..getCart(),
      child: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is CartSuccessful) {
            return Scaffold(
              appBar: CustomAppbarOfCartAndProductDetails
                  .customAppBarOfCartAndProductDetails(context, "Cart", false),
              body: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ListView.builder(
                    itemCount: state.cartEntity.data?.products?.length,
                    itemBuilder: (context, index) {
                      return CustomItemOfProduct(
                        cartEntity: state.cartEntity,
                        index1: index,
                        type: false,
                      );
                    },
                  )),
              bottomNavigationBar: BottomNavOfCheckOrAddItem(
                title: "Check Out",
                price: state.cartEntity.data!.totalCartPrice.toString(),
                check: false,
              ),
            );
          } else if (state is CartFailure) {
            return Scaffold(
                body: Center(child: SizedBox(child: Text(state.error))));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
