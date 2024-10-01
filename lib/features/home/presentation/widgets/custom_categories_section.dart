import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';

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
            const Spacer(),
            Text(
              "view all",
              style: AppStyles.textRegular14(context),
            )
          ],
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height*.3,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
            gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 3),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(Assets.imagesCat))),
                    ),
                  ),
                  const SizedBox(height: 1,),
                  FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Text(
                      "Women's fashion",
                      maxLines: 2,
                      style: AppStyles.textRegular14(context),
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}