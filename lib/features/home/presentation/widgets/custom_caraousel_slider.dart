

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
  const CustomCarouselSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [1, 2, 3].map((i) {
        return Builder(builder: (BuildContext context) {
          return ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: Image.asset(
                'assets/images/image$i.png',
              ));
        });
      }).toList(),
      options: CarouselOptions(viewportFraction: 1),
    );
  }
}