import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_height.dart';
import '../../../../core/utils/custom_space_width.dart';

class CustomDetailsOfProduct extends StatelessWidget {
  const CustomDetailsOfProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomSpaceHeight(height: .01),
        Text(
          "Nike Air Jordon",
          style: AppStyles.textMedium18(context),
        ),
        const CustomSpaceHeight(height: .005),
        Row(
          children: [
            Container(
              height: 15,
              width: 15,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(30)),
            ),
            const CustomSpaceWidth(width: .02),
            Text(
              "Black Color",
              style: AppStyles.textRegular14(context),
            ),
          ],
        ),
        const CustomSpaceHeight(height: .01),
        Row(
          children: [
            Text(
              "EGP 600",
              style: AppStyles.textMedium18(context),
            ),
            const CustomSpaceWidth(width: .02),
            Text(
              "EGP 750",
              style: AppStyles.textRegular11(context).copyWith(
                  decoration: TextDecoration.lineThrough),
            )
          ],
        )
      ],
    );
  }
}
