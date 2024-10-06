import 'package:e_commrece/core/utils/custom_space_width.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_height.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: mainColor),
              borderRadius: const BorderRadius.all(Radius.circular(16))),
          width: MediaQuery.sizeOf(context).width * .6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.topRight,
                children: [
                  Image.asset(Assets.imagesTest),
                  SvgPicture.asset(Assets.imagesFavIcon)
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Washing Machine",
                      maxLines: 2,
                      style: AppStyles.textRegular18(context),
                    ),
                    const CustomSpaceHeight(height: .009),
                    Row(
                      children: [
                        Text(
                          "EGP 9000",
                          style: AppStyles.textRegular14(context),
                        ),
                        const CustomSpaceWidth(width: .03),
                        Text(
                          "EGP 9000",
                          style: AppStyles.textLight14(context)
                              .copyWith(decoration: TextDecoration.lineThrough),
                        ),
                      ],
                    ),
                    const CustomSpaceHeight(height: .005),
                    Row(
                      children: [
                        Text(
                          "Review (4.8)",
                          style: AppStyles.textRegular12(context),
                        ),
                        SvgPicture.asset(Assets.imagesStar),
                        const Spacer(),
                        SvgPicture.asset(
                          Assets.imagesAdd,
                          height: MediaQuery.sizeOf(context).height * .04,
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
