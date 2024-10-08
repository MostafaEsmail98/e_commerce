import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:e_commrece/features/home/presentation/manager/categories_tab_cubit/categories_tab_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/routes.dart';

class CustomSubCategories extends StatelessWidget {
  const CustomSubCategories({super.key,});


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: BlocBuilder<CategoriesCubit, CategoriesState>(
            builder: (context, state) {
              if (state is CategoriesSuccessful) {
                return BlocBuilder<CategoriesTabCubit, CategoriesTabState>(
                  builder: (context, state) {
                    if (state is CategoriesTabSuccessful) {
                      return GridView.builder(
                        itemCount: state.categoriesTabEntity.data!.length,
                        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 4 / 7, crossAxisCount: 3),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              GoRouter.of(context).push(
                                '/ProductItems',
                                extra: CheckApi(
                                    res: state.categoriesTabEntity
                                        .data![index].category!
                                        .id,
                                    check: false),
                              );
                            },
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 4 / 5,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: CachedNetworkImage(
                                      imageUrl:
                                      state.categoriesTabEntity.data![index]
                                          .imageCover!,
                                    ),
                                  ),
                                ),
                                const CustomSpaceHeight(height: .005),
                                FittedBox(
                                  fit: BoxFit.scaleDown,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: Text(
                                      state.categoriesTabEntity
                                          .data![index].subcategory![0].name!,
                                      style: AppStyles.textRegular14(context),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      );
                    }
                    else if (state is CategoriesTabFailure) {
                      return  Center(child: Text(state.errorModel));
                    }
                    else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                );
              }
              else {
                return const Expanded(
                    child: Center(child: CircularProgressIndicator()));
              }
            },
          ),
        ),
      ],
    );
  }
}
