import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/get_wishlist_entity.dart';
import 'package:e_commrece/features/home/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_width.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';
import 'custom_details_of_product.dart';
import 'custom_number_of_product.dart';

class CustomItemOfProduct extends StatelessWidget {
  const CustomItemOfProduct(
      {super.key, required this.type, this.getWishlistEntity, this.index});

  final bool type;
  final int? index;

  final GetWishlistEntity? getWishlistEntity;

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
                  child: CachedNetworkImage(
                      imageUrl:
                          getWishlistEntity?.data?[index ?? 0].imageCover ??
                              "")),
              const CustomSpaceWidth(width: .03),
              CustomDetailsOfProduct(
                  type: true,
                  getWishlistEntity: getWishlistEntity,
                  index: index),
              const Spacer(),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    InkWell(
                        onTap: () {
                          context.read<GetWishlistCubit>().deleteWishlist(
                              PostWishlistParams(productId: getWishlistEntity!.data?[index ?? 0].id));
                        },
                        child: SvgPicture.asset(Assets.imagesDelete)),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: type == true
                          ? Center(
                              child: FittedBox(
                              fit: BoxFit.scaleDown,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 8),
                                child: Text(
                                  "Add to Cart",
                                  style: AppStyles.textMedium14(context)
                                      .copyWith(color: Colors.white),
                                ),
                              ),
                            ))
                          : const CustomNumberOfProduct(),
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
