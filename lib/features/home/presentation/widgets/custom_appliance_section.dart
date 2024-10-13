import 'package:e_commrece/core/utils/routes.dart';
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
              if (state is BrandsSuccessful) {
                return ListView.builder(
                  itemCount: state.brandsEntity.data?.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                        onTap: () {
                          GoRouter.of(context).push('/ProductItems',
                              extra:CheckApi(res:  state.brandsEntity.data![index].id??"",check: true));
                        },
                        child: CustomCategoriesItem(
                            image: state.brandsEntity.data![index].image ?? "",
                            name: state.brandsEntity.data![index].name ?? ""));
                  },
                );
              }
              else if (state is BrandsFailure) {
                return  Center(
                    child: Text(state.errorModel));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        )
      ],
    );
  }
}
