import 'package:e_commrece/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/routes.dart';
import 'custom_categories_item.dart';

class CustomCategoriesSection extends StatelessWidget {
  const CustomCategoriesSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesCubit()..getAllCategories(),
      child: Column(
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
                      crossAxisCount: 2,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 3),
                  itemBuilder: (context, index) {
                    return (state is CategoriesSuccessful)
                        ? InkWell(
                            onTap: () {
                              GoRouter.of(context).push(AppRouter.productItems,
                                  extra: CheckApi(
                                      res: state
                                          .categoriesEntity.data![index].id,
                                      check: false));
                            },
                            child: CustomCategoriesItem(
                              image:
                                  state.categoriesEntity.data![index].image ??
                                      "",
                              name: state.categoriesEntity.data![index].name ??
                                  "",
                            ),
                          )
                        : (state is CategoriesFailure)
                            ? FittedBox(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(state.errorModel),
                                ),
                              )
                            : const Center(child: CircularProgressIndicator());
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
