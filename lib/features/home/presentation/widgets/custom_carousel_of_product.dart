import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/presentation/manager/get_wishlist_cubit/get_wishlist_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';

class CustomCarouselOfProduct extends StatelessWidget {
  const CustomCarouselOfProduct({
    super.key,
    required this.images, required this.id,
  });
  final String id ;
  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: mainColor),
                borderRadius: BorderRadius.circular(12)),
            child: CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int itemIndex,
                      int pageViewIndex) =>
                  ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      child: CachedNetworkImage(
                        errorWidget: (context, url, error) => const Icon(Icons.error),
                        imageUrl: images[itemIndex],
                        fit: BoxFit.fill,
                      )),
              options:
                  CarouselOptions(viewportFraction: 1, aspectRatio: 400 / 300),
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: InkWell(
            onTap: () {
              context.read<GetWishlistCubit>().postWishlist(PostWishlistParams(productId: id));
            },
            child: SvgPicture.asset(
              Assets.imagesFavoriteList,
            ),
          ),
        ),
      ],
    );
  }
}
