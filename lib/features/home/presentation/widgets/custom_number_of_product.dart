import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/core/utils/custom_space_width.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../generated/assets.dart';
import '../manager/cart_cubit/cart_cubit.dart';

class CustomNumberOfProduct extends StatefulWidget {
  const CustomNumberOfProduct({
    super.key,
    this.count,
    this.id,
    required this.check,
  });

  final int? count;
  final String? id;
  final bool check;

  @override
  State<CustomNumberOfProduct> createState() => _CustomNumberOfProductState();
}

class _CustomNumberOfProductState extends State<CustomNumberOfProduct> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const CustomSpaceWidth(width: .02),
          GestureDetector(
              onTap: () {
                if (widget.check == true) {
                  context.read<CartCubit>().countCart(CartParams(
                      count: widget.count! - 1, productId: widget.id));
                } else {
                  if ( context.read<CartCubit>().count>0) {
                    context.read<CartCubit>().count--;
                    setState(() {});
                  }
                }
              },
              child: SvgPicture.asset(Assets.imagesMinus)),
          const CustomSpaceWidth(width: .02),
          Text(
            widget.check == true
                ? widget.count.toString()
                : context.read<CartCubit>().count.toString(),
            style:
                AppStyles.textMedium18(context).copyWith(color: Colors.white),
          ),
          const CustomSpaceWidth(width: .02),
          GestureDetector(
              onTap: () {
                if (widget.check == true) {
                  context.read<CartCubit>().countCart(CartParams(
                      count: widget.count! + 1, productId: widget.id));
                } else {
                  context.read<CartCubit>().count++;
                  setState(() {});
                }
              },
              child: SvgPicture.asset(Assets.imagesPlus)),
          const CustomSpaceWidth(width: .02),
        ],
      ),
    );
  }
}
