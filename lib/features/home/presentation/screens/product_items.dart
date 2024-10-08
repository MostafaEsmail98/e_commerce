import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/manager/all_product_cubit/all_product_cubit.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                            GoRouter.of(context).push('/ProductDetails',
                                extra: state.allProductEntity.data![index]
                                    .id);
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
    );
  }
}
