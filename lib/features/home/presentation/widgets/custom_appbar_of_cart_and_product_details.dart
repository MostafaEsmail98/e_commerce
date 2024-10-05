import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';

class CustomAppbarOfCartAndProductDetails{
  static AppBar customAppBarOfCartAndProductDetails(BuildContext context,String title) {
    return AppBar(
      leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: mainColor,
          )),
      centerTitle: true,
      title: Text(
        title,
        style: AppStyles.textMedium22(context),
      ),
      actions: [
        InkWell(
            onTap: () {
            },
            child: SvgPicture.asset(Assets.imagesSearch)),
        const SizedBox(width: 16),
        InkWell(
            onTap: () {
            },
            child: SvgPicture.asset(Assets.imagesCart)),
        const SizedBox(width: 16),
      ],
    );
  }
}