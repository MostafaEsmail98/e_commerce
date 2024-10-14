import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';
import 'package:e_commrece/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:e_commrece/features/home/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/routes.dart';

class ProductItems extends StatelessWidget {
  const ProductItems({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetWishlistCubit(),
        ),
        BlocProvider(
          create: (context) => CartCubit(),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
          BlocListener<GetWishlistCubit, GetWishlistState>(
            listener: (context, state) {
              if (state is PostWishlistSuccessful) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.postWishlistModel.message!)));
              } else if (state is PostWishlistFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorModel)));
              } else if (state is DeleteWishlistSuccessful) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text(state.deleteWishlistModel.message!)));
              } else if (state is DeleteWishlistFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.errorModel)));
              }
            },
          ),
          BlocListener<CartCubit, CartState>(
            listener: (context, state) {
              if (state is CartAddSuccessful) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.res)));
              } else if (state is CartAddFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.error)));
              }
            },
          )
        ],
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const CustomLogoAndSearch(),
                const CustomSpaceHeight(height: .01),
                Expanded(child: BlocBuilder<AllProductCubit, AllProductState>(
                  builder: (context, state) {
                    if (state is AllProductSuccessful) {
                      return GridView.builder(
                        itemCount: state.allProductEntity.data!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                childAspectRatio: 3 / 6.5,
                                crossAxisSpacing: 12,
                                mainAxisSpacing: 3,
                                crossAxisCount: 2),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                GoRouter.of(context).push(AppRouter.productDetails,
                                    extra:
                                        state.allProductEntity.data![index].id);
                              },
                              child: CustomProductItem(
                                dataEntity: state.allProductEntity.data![index],
                              ));
                        },
                      );
                    } else if (state is AllProductFailure) {
                      return const Center(
                          child: SizedBox(width: 24, child: Icon(Icons.error)));
                    } else {
                      return const SizedBox(
                          width: 50,
                          height: 24,
                          child: Center(child: CircularProgressIndicator()));
                    }
                  },
                ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
