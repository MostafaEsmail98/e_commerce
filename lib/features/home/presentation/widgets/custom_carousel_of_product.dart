import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';

class CustomCarouselOfProduct extends StatelessWidget {
  const CustomCarouselOfProduct({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topRight,
      children: [
        Container(
            decoration: BoxDecoration(
                border: Border.all(color: mainColor),
                borderRadius: BorderRadius.circular(12)),
            child: CarouselSlider(
              items: [1, 2, 3].map((i) {
                return Builder(builder: (BuildContext context) {
                  return ClipRRect(
                      borderRadius:
                      const BorderRadius.all(Radius.circular(5)),
                      child: Image.asset(
                        Assets.imagesProduct,
                        fit: BoxFit.fill,
                      ));
                });
              }).toList(),
              options: CarouselOptions(
                  viewportFraction: 1, aspectRatio: 400 / 300),
            )),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12)),
              child: SvgPicture.asset(
                Assets.imagesFavorite,
                colorFilter:
                const ColorFilter.mode(mainColor, BlendMode.srcIn),
              )),
        ),
      ],
    );
  }
}