import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_width.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';
import 'custom_details_of_product.dart';
import 'custom_number_of_product.dart';

class CustomItemOfProduct extends StatelessWidget {
  const CustomItemOfProduct({
    super.key,
    required this.type,
  });

  final bool type;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: AspectRatio(
        aspectRatio: 400 / 120,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: mainColor),
              borderRadius: BorderRadius.circular(15)),
          child: Row(
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(Assets.imagesSubcat)),
              const CustomSpaceWidth(width: .03),
              const CustomDetailsOfProduct(),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    type==true?SvgPicture.asset(Assets.imagesFavoriteList):SvgPicture.asset(Assets.imagesDelete),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: type==true?Center(
                          child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5.0,horizontal: 8),
                          child: Text(
                            "Add to Cart",
                            style: AppStyles.textMedium14(context)
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      )):const CustomNumberOfProduct(),
                    )
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

