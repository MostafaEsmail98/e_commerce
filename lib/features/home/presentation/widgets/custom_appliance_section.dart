
import 'package:e_commrece/features/home/presentation/widgets/custom_categories_item.dart';
import 'package:flutter/material.dart';
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
          height: MediaQuery.sizeOf(context).height * .25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap:  () {
                    GoRouter.of(context).push('/ProductDetails');
                  },
                  child: const CustomCategoriesItem(image: "", name: "name"));
            },
          ),
        )
      ],
    );
  }
}


