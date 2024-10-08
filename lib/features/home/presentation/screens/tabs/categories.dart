import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_list_of_categories.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_sub_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/categories_tab_cubit/categories_tab_cubit.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: BlocProvider(
            create: (context) => CategoriesTabCubit()
              ..getCategoriesTab(
                  CategoriesTabParams(id: "6439d5b90049ad0b52b90048")),
            child: Column(
              children: [
                const CustomLogoAndSearch(),
                const CustomSpaceHeight(height: 0.01),
                BlocBuilder<CategoriesTabCubit, CategoriesTabState>(
                  builder: (context, state) {
                    if (state is CategoriesTabSuccessful) {
                      return Expanded(
                        child: Row(
                          children: [
                            const Expanded(
                                flex: 1, child: CustomListOfCategories()),
                            Expanded(
                                flex: 2,
                                child: CustomSubCategories(
                                  categoriesTabEntity:
                                      state.categoriesTabEntity,
                                ))
                          ],
                        ),
                      );
                    }
                    else if (state is CategoriesTabLoading){
                      return const Expanded(
                          child: Center(child: CircularProgressIndicator()));
                    }
                    else {
                     return const Expanded(child: Center(child: Icon(Icons.error),));
                    }
                  },
                )
              ],
            )));
  }
}
