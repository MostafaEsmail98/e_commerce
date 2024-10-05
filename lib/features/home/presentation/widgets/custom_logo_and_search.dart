import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/k_colors.dart';
import '../../../../generated/assets.dart';

class CustomLogoAndSearch extends StatelessWidget {
  const CustomLogoAndSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SvgPicture.asset(
          Assets.assetsImagesLogo,
          width: 120,
          colorFilter:
          const ColorFilter.mode(mainColor, BlendMode.srcIn),
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: mainColor),
                        borderRadius:
                        BorderRadius.all(Radius.circular(32))),
                    focusedBorder: const OutlineInputBorder(
                        borderSide: BorderSide(color: mainColor),
                        borderRadius:
                        BorderRadius.all(Radius.circular(32))),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0),
                      child: SvgPicture.asset(
                        Assets.imagesSearch,
                      ),
                    ),
                    hintText: "what do you search for?",
                    hintStyle: AppStyles.textLight16(context)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: GestureDetector(
                  onTap: () {
                    GoRouter.of(context).push("/Cart");
                  },
                  child: SvgPicture.asset(Assets.imagesCart)),
            )
          ],
        ),
      ],
    );
  }
}
