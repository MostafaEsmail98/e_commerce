import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/utils/k_colors.dart';
import '../../../../../generated/assets.dart';
import '../../widgets/custom_field_of_profile.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              Assets.assetsImagesLogo,
              width: 120,
              colorFilter: const ColorFilter.mode(mainColor, BlendMode.srcIn),
            ),
            Text(
              "Welcome, Mostafa",
              style: AppStyles.textMedium20(context),
            ),
            const CustomSpaceHeight(height: .001),
            Text(
              "mostata98@gmail.com",
              style: AppStyles.textMedium14(context),
            ),
            const CustomSpaceHeight(height: .04),
            const CustomFieldOfProfile(title: 'Your full name', content: 'Mostafa Esmail',),
            const CustomFieldOfProfile(title: 'Your E-mail', content: 'mostafa98@gmail.com',),
            const CustomFieldOfProfile(title: 'Your password', content: '*****************',),
            const CustomFieldOfProfile(title: 'Your mobile number', content: '01101340325',),
            const CustomFieldOfProfile(title: 'Your Address', content: '6th October, street 11.....',),
          ],
        ),
      ),
    );
  }
}
