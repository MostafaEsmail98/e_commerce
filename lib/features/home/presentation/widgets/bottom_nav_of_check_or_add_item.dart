import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/k_colors.dart';

class BottomNavOfCheckOrAddItem extends StatelessWidget {
  const BottomNavOfCheckOrAddItem({
    super.key, required this.title, required this.price,
  });
  final String title ;
  final num price ;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text(
                  "Total price",
                  style: AppStyles.textMedium18(context)
                      .copyWith(color: const Color(0xff06004F)),
                ),
                Text(
                  "EGP $price",
                  style: AppStyles.textMedium18(context),
                )
              ],
            ),
            Container(
              decoration: BoxDecoration(
                  color: mainColor, borderRadius: BorderRadius.circular(12)),
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, bottom: 8.0, right: 32, left: 32),
                child: Text(
                  title,
                  style: AppStyles.textMedium20(context)
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
