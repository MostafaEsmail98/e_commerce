import 'package:cached_network_image/cached_network_image.dart';
import 'package:e_commrece/core/utils/custom_space_height.dart';
import 'package:e_commrece/features/home/domain/entity/categories_tab_entity.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/routes.dart';


class CustomSubCategories extends StatelessWidget {
  const CustomSubCategories({super.key, required this.categoriesTabEntity});

  final CategoriesTabEntity categoriesTabEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: GridView.builder(
            itemCount: categoriesTabEntity.data!.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 4 / 7, crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () {
                  GoRouter.of(context).push(
                    '/ProductItems',extra: CheckApi(res: categoriesTabEntity.data![index].category!.id,check: false)
                  );
                },
                child: Column(
                  children: [
                    AspectRatio(
                      aspectRatio: 4 / 5,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: CachedNetworkImage(
                          imageUrl: categoriesTabEntity.data![index].imageCover!,
                        ),
                      ),
                    ),
                    const CustomSpaceHeight(height: .005),
                    FittedBox(
                      fit: BoxFit.scaleDown,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Text(
                          categoriesTabEntity
                              .data![index].subcategory![0].name!,
                          style: AppStyles.textRegular14(context),
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
