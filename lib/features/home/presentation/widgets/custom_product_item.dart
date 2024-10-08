import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/custom_space_width.dart';
import 'package:e_commrece/features/home/domain/entity/all_product_entity.dart';
import 'package:e_commrece/features/home/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_height.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';

class CustomProductItem extends StatelessWidget {
  const CustomProductItem({
    super.key,
    required this.dataEntity,
  });

  final DataEntity dataEntity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: mainColor),
          borderRadius: const BorderRadius.all(Radius.circular(16))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: CachedNetworkImage(
                      width: double.maxFinite,
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      imageUrl: dataEntity.imageCover ?? "",
                      fit: BoxFit.cover)),
              GestureDetector(
                  onTap: () {
                      context.read<GetWishlistCubit>().postWishlist(
                          PostWishlistParams(productId: dataEntity.id));
                  },
                  child: SvgPicture.asset(Assets.imagesFavoriteList))
            ],
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  dataEntity.title ?? "",
                  maxLines: 2,
                  style: AppStyles.textRegular18(context),
                ),
                const CustomSpaceHeight(height: .009),
                Row(
                  children: [
                    Text(
                      "${dataEntity.price}",
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
                      "Review (${dataEntity.ratingsAverage})",
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
    );
  }
}
