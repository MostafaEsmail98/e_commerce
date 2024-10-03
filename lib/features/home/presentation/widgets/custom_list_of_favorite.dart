import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_width.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';
import 'custom_details_of_product.dart';

class ListOfFavorite extends StatelessWidget {
  const ListOfFavorite({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return AspectRatio(
          aspectRatio: 400 / 115,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
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
                    padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SvgPicture.asset(Assets.imagesFavoriteList),
                        const Spacer(),
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                            color: mainColor,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Center(
                              child: Text(
                            "Add to Cart",
                            style: AppStyles.textMedium14(context)
                                .copyWith(color: Colors.white),
                          )),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

