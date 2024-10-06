
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomCategoriesItem extends StatelessWidget {
  const CustomCategoriesItem({
    super.key,
    required this.image,
    required this.name,
  });

  final String image;

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: CircleAvatar(
                backgroundColor: Colors.transparent,
                radius: 50,
                child: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl: image,
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            )),
        const SizedBox(
          height: 1,
        ),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              name,
              maxLines: 2,
              style: AppStyles.textRegular14(context),
            )),
      ],
    );
  }
}
