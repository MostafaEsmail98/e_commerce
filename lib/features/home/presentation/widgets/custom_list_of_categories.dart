import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_width.dart';
import '../../../../core/utils/k_colors.dart';

class CustomListOfCategories extends StatefulWidget {
  const CustomListOfCategories({super.key});

  @override
  State<CustomListOfCategories> createState() => _CustomListOfCategoriesState();
}

class _CustomListOfCategoriesState extends State<CustomListOfCategories> {
  late int active = 0;
  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: const BoxDecoration(
          border: Border(
              left: BorderSide(color: Colors.grey),
              top: BorderSide(color: Colors.grey)),
          borderRadius:
          BorderRadius.only(topLeft: Radius.circular(12))),
      child: ClipRRect(
        borderRadius:
        const BorderRadius.only(topLeft: Radius.circular(12)),
        child: ListView.builder(
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                if (active != index) {
                  setState(() {});
                  active = index;
                }
              },
              child: FittedBox(
                alignment: Alignment.centerLeft,
                fit: BoxFit.fill,
                child: Container(
                  color: active == index ? null : strokColor,
                  padding: const EdgeInsets.only(
                      left: 5, top: 5, bottom: 5),
                  child: Row(
                    children: [
                      Container(
                        decoration: active == index
                            ? BoxDecoration(
                            color: mainColor,
                            borderRadius:
                            BorderRadius.circular(12))
                            : null,
                        width: 5,
                        height: 75,
                      ),
                      const CustomSpaceWidth(width: .01),
                      Padding(
                        padding:
                        const EdgeInsets.only(right: 5.0),
                        child: Text(
                          "Men's Fashion",
                          style: AppStyles.textMedium14(context),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
