import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_list_of_categories.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/params/params.dart';
import '../../manager/categories_cubit/categories_cubit.dart';
import '../../manager/categories_tab_cubit/categories_tab_cubit.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CategoriesTabCubit()
        ..getCategoriesTab(CategoriesTabParams(id: "6439d5b90049ad0b52b90048")),
      child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              const CustomLogoAndSearch(),
              const CustomSpaceHeight(height: 0.01),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: BlocBuilder<CategoriesCubit, CategoriesState>(
                          builder: (context, state) {
                            if (state is CategoriesSuccessful) {
                              return const CustomListOfCategories();
                            } else if (state is CategoriesFailure) {
                              return Expanded(
                                  child: Center(
                                child: Text(state.errorModel),
                              ));
                            } else {
                              return const Expanded(
                                  child: Center(
                                      child: CircularProgressIndicator()));
                            }
                          },
                        )),
                    const Expanded(flex: 2, child: CustomSubCategories())
                  ],
                ),
              )
            ],
          )),
    );
  }
}
