
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


import '../../../../core/utils/app_styles.dart';

import 'custom_product_item.dart';

class CustomApplianceSection extends StatelessWidget {
  const CustomApplianceSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          "Home Appliance",
          style: AppStyles.textSemiBold24(context),
        ),
        SizedBox(
          height: MediaQuery.sizeOf(context).height * .25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return InkWell(
                  onTap:  () {
                    GoRouter.of(context).push('/ProductDetails');
                  },
                  child: const CustomProductItem());
            },
          ),
        )
      ],
    );
  }
}


