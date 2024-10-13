import 'package:e_commrece/features/home/domain/entity/specific_product_entity.dart';
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
    required this.specificProductEntity,
  });

  final SpecificProductEntity specificProductEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: MediaQuery.sizeOf(context).width*.65,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Text(
                  specificProductEntity.data!.title!,
                  style: AppStyles.textMedium20(context),
                ),
              ),
            ),
            Text(
              "${specificProductEntity.data!.price!} EGP",
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
                  "${specificProductEntity.data!.sold} Sold",
                  style: AppStyles.textMedium14(context),
                ),
              ),
            ),
            const CustomSpaceWidth(width: .03),
            Row(
              children: [
                SvgPicture.asset(Assets.imagesStar),
                Text(
                  "${specificProductEntity.data!.ratingsAverage} (${specificProductEntity.data!.ratingsQuantity})",
                  style: AppStyles.textRegular14(context),
                )
              ],
            ),
            const Spacer(),
            Container(
                decoration: BoxDecoration(
                    color: mainColor, borderRadius: BorderRadius.circular(24)),
                child:   const CustomNumberOfProduct(
                  check: false,))
          ],
        ),
        ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(
            "Description",
            style: AppStyles.textMedium18(context),
          ),
          subtitle: Text(
            specificProductEntity.data!.description!,
            style: AppStyles.textRegular14(context),
          ),
        ),
      ],
    );
  }
}
