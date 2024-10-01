
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../generated/assets.dart';


class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        width: MediaQuery.sizeOf(context).width * .75,
        Assets.assetsImagesLogo,
        colorFilter:
        const ColorFilter.mode(Colors.white, BlendMode.srcIn),
      ),
    );
  }
}

