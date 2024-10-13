import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/presentation/widgets/custom_logo_and_search.dart';
import 'package:flutter/material.dart';

import '../../widgets/custom_list_of_favorite.dart';

class Favorite extends StatelessWidget {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        children: [
          CustomLogoAndSearch(),
          CustomSpaceHeight(height: .02),
          Expanded(child: ListOfFavorite())
        ],
      ),
    );
  }
}


