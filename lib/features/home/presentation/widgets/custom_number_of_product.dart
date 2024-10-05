import 'package:e_commrece/core/utils/custom_space_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';

class CustomNumberOfProduct extends StatelessWidget {
  const CustomNumberOfProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomSpaceWidth(width: .02),
          SvgPicture.asset(Assets.imagesMinus),
          const CustomSpaceWidth(width: .02),
          Text(
            "1",
            style:
                AppStyles.textMedium18(context).copyWith(color: Colors.white),
          ),
          const CustomSpaceWidth(width: .02),
          SvgPicture.asset(Assets.imagesPlus),
          const CustomSpaceWidth(width: .02),
        ],
      ),
    );
  }
}
