import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:flutter/material.dart';
import '../../widgets/custom_appliance_section.dart';
import '../../widgets/custom_caraousel_slider.dart';
import '../../widgets/custom_categories_section.dart';
import '../../widgets/custom_logo_and_search.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          children: [
            CustomLogoAndSearch(),
            CustomSpaceHeight(height: .02),
            CustomCarouselSlider(),
            CustomCategoriesSection(),
            CustomSpaceHeight(height: .01),
            CustomBrandsSection(),
            CustomSpaceHeight(height: .015),
          ],
        ),
      ),
    );
  }
}

