
import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key, required this.text,
  });
  final String text ;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {},
        child: Text(
          text,
          style: AppStyles.textRegular18(context)
              .copyWith(color: Colors.white),
        ));
  }
}