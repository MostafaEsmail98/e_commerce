import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/k_colors.dart';

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
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: mainColor),
                        borderRadius:
                        const BorderRadius.all(Radius.circular(16))),
                    width: 160,
                    height: 210,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          alignment: Alignment.topRight,
                          children: [
                            Image.asset(Assets.imagesTest),
                            SvgPicture.asset(Assets.imagesFavIcon)
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment:
                            CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Washing Machine",
                                style: AppStyles.textRegular14(context),
                              ),
                              const CustomSpaceHeight(height: .005),
                              Text(
                                "Review (4.8)",
                                style: AppStyles.textRegular12(context),
                              ),
                              const CustomSpaceHeight(height: .009),
                              Row(
                                children: [
                                  const Text("EGP 9000"),
                                  const Spacer(),
                                  SvgPicture.asset(
                                    Assets.imagesAdd,
                                    height: MediaQuery.sizeOf(context)
                                        .height *
                                        .024,
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
