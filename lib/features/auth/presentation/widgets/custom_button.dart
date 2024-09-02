

import 'package:e_commrece/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15)))),
        onPressed: () {},
        child: Container(
          height: MediaQuery.sizeOf(context).height * .06,
          width: double.maxFinite,
          decoration: const BoxDecoration(),
          child: Center(
              child: Text(
                "Login",
                style: AppStyles.textSemiBold18(context),
              )),
        ));
  }
}
