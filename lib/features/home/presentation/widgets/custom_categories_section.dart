import 'package:e_commrece/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_styles.dart';
import 'custom_categories_item.dart';

class CustomCategoriesSection extends StatelessWidget {
  const CustomCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(
              "Categories",
              style: AppStyles.textSemiBold24(context),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .3,
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              return GridView.builder(
                itemCount: (state is CategoriesSuccessful)
                    ? state.categoriesEntity.data!.length
                    : 10,
                scrollDirection: Axis.horizontal,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 3),
                itemBuilder: (context, index) {
                  return (state is CategoriesSuccessful)
                      ? CustomCategoriesItem(
                          image:
                              state.categoriesEntity.data![index].image ?? "",
                          name: state.categoriesEntity.data![index].name ?? "",
                        )
                      : (state is CategoriesFailure)
                          ? const Center(
                              child:
                                  SizedBox(width: 24, child: Icon(Icons.error)))
                          : const Center(
                              child: SizedBox(
                                  width: 24,
                                  height: 24,
                                  child: CircularProgressIndicator()));
                },
              );
            },
          ),
        )
      ],
    );
  }
}
