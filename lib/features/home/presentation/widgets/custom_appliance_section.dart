import 'package:e_commrece/features/home/presentation/manager/brands_cubit/brands_cubit.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_categories_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_styles.dart';

class CustomBrandsSection extends StatelessWidget {
  const CustomBrandsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Brands",
          style: AppStyles.textSemiBold24(context),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .15,
          child: BlocBuilder<BrandsCubit, BrandsState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: (state is BrandsSuccessful)
                    ? state.brandsEntity.data?.length??10:10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        GoRouter.of(context).push('/ProductDetails');
                      },
                      child: (state is BrandsSuccessful)
                          ? CustomCategoriesItem(
                              image:
                                  state.brandsEntity.data![index].image ?? "",
                              name: state.brandsEntity.data![index].name ?? "")
                          : (state is BrandsFailure)
                              ? const Center(
                                  child: SizedBox(
                                      width: 24, child: Icon(Icons.error)))
                              : const SizedBox(
                                width: 50,
                                height: 24,
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              ));
                },
              );
            },
          ),
        )
      ],
    );
  }
}
