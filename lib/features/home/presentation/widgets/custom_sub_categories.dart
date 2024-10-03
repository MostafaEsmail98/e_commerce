import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_styles.dart';

class CustomSubCategories extends StatelessWidget {
  const CustomSubCategories({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 8.0),
          child: Text(
            "Men’s Fashion",
            style: AppStyles.textMedium18(context),
          ),
        ),
        Expanded(
          child: GridView.builder(
            itemCount: 20,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 5, crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  GoRouter.of(context).push('/ProductItems');
                },
                child: Column(
                  children: [
                    Image.asset(
                      Assets.imagesSubcat,
                      width: MediaQuery.sizeOf(context).width * .18,
                    ),
                    const CustomSpaceHeight(height: .005),
                    Text(
                      "T-Shirts",
                      style: AppStyles.textRegular14(context),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
