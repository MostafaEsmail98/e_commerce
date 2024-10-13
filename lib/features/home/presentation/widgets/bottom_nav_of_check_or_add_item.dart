import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/presentation/manager/cart_cubit/cart_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/k_colors.dart';

class BottomNavOfCheckOrAddItem extends StatelessWidget {
  const BottomNavOfCheckOrAddItem({
    super.key,
    required this.title,
    required this.price,
    required this.check,
    this.id,
  });

  final String title;

  final String price;

  final bool check;

  final String? id;

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
            InkWell(
              onTap: () async {
                if (check == true) {
                  await context
                      .read<CartCubit>()
                      .addCart(CartParams(productId: id));
                  if (context.mounted) {
                    context.read<CartCubit>().countCart(CartParams(
                        productId: id, count: context.read<CartCubit>().count));
                  }
                }
              },
              child: Container(
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
