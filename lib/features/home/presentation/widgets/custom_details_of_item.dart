
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_height.dart';
import '../../../../core/utils/custom_space_width.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';
import 'custom_number_of_product.dart';

class CustomDetailsOfItem extends StatelessWidget {
  const CustomDetailsOfItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Nike Air Jordon",
              style: AppStyles.textMedium20(context),
            ),
            Text(
              "EGP 2000",
              style: AppStyles.textMedium20(context),
            ),
          ],
        ),
        const CustomSpaceHeight(height: .02),
        Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                border: Border.all(color: mainColor),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "3,230 Sold",
                  style: AppStyles.textMedium14(context),
                ),
              ),
            ),
            const CustomSpaceWidth(width: .03),
            Row(
              children: [
                SvgPicture.asset(Assets.imagesStar),
                Text(
                  "4.8 (7,500)",
                  style: AppStyles.textRegular14(context),
                )
              ],
            ),
            const Spacer(),
            Container(
                decoration: BoxDecoration(
                    color: mainColor,
                    borderRadius: BorderRadius.circular(24)),
                child: const CustomNumberOfProduct())
          ],
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Description",
            style: AppStyles.textMedium18(context),
          ),
          subtitle: Text(
            "Nike is a multinational corporation that designs, develops, and sells athletic footwear ,apparel, and accessories......Read More ",
            style: AppStyles.textRegular14(context),
          ),
        ),
      ],
    );
  }
}
