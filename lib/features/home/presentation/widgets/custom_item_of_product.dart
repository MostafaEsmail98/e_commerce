import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/domain/entity/cart_entity.dart';
import 'package:e_commrece/features/home/domain/entity/get_wishlist_entity.dart';
import 'package:e_commrece/features/home/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_width.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';
import '../manager/cart_cubit/cart_cubit.dart';
import 'custom_details_of_product.dart';
import 'custom_number_of_product.dart';

class CustomItemOfProduct extends StatelessWidget {
  const CustomItemOfProduct(
      {super.key,
      required this.type,
      this.getWishlistEntity,
      this.index,
      this.cartEntity,
      this.index1});

  final bool type;
  final int? index;
  final int? index1;

  final GetWishlistEntity? getWishlistEntity;
  final CartEntity? cartEntity;

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
                      imageUrl: type == true
                          ? getWishlistEntity?.data![index ?? 0].imageCover ??
                              ""
                          : cartEntity?.data?.products?[index1 ?? 0].product
                                  ?.imageCover ??
                              "")),
              const CustomSpaceWidth(width: .03),
              CustomDetailsOfProduct(
                  title:
                      cartEntity?.data?.products![index1 ?? 0].product?.title ??
                          "",
                  price: cartEntity?.data?.products![index1 ?? 0].price ?? 0,
                  type: type,
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
                          if (type == true) {
                            context.read<GetWishlistCubit>().deleteWishlist(
                                PostWishlistParams(
                                    productId: getWishlistEntity!
                                        .data?[index ?? 0].id));
                          } else {
                            context.read<CartCubit>().deleteCart(CartParams(
                                productId: cartEntity!
                                    .data?.products![index1 ?? 0].product!.id));
                          }
                        },
                        child: SvgPicture.asset(Assets.imagesDelete)),
                    const Spacer(),
                    Container(
                      decoration: BoxDecoration(
                        color: mainColor,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: type == true
                          ? FittedBox(
                              fit: BoxFit.scaleDown,
                              child: GestureDetector(
                                onTap: () {
                                  if (type == true) {
                                    context.read<CartCubit>().addCart(
                                        CartParams(
                                            productId: getWishlistEntity!
                                                .data?[index ?? 0].id));
                                  }
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 5.0, horizontal: 8),
                                  child: Text(
                                    "Add to Cart",
                                    style: AppStyles.textMedium14(context)
                                        .copyWith(color: Colors.white),
                                  ),
                                ),
                              ),
                            )
                          : CustomNumberOfProduct(
                        check: true,
                              count: cartEntity
                                  ?.data?.products?[index1 ?? 0].count
                                  ?.toInt(),
                              id: cartEntity
                                  ?.data?.products?[index1 ?? 0].product!.id,
                            ),
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
