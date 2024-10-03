import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_list_of_categories.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_sub_categories.dart';
import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomLogoAndSearch(),
          CustomSpaceHeight(height: 0.01),
          Expanded(
            child: Row(
              children: [
                Expanded(flex: 1, child: CustomListOfCategories()),
                Expanded(
                    flex: 2,
                    child: CustomSubCategories())
              ],
            ),
          )
        ],
      ),
    );
  }
}
