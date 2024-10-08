import 'package:e_commrece/core/params/params.dart';
import 'package:e_commrece/features/home/presentation/manager/categories_cubit/categories_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_width.dart';
import '../../../../core/utils/k_colors.dart';
import '../manager/categories_tab_cubit/categories_tab_cubit.dart';

class CustomListOfCategories extends StatefulWidget {
  const CustomListOfCategories({super.key});

  @override
  State<CustomListOfCategories> createState() => _CustomListOfCategoriesState();
}

class _CustomListOfCategoriesState extends State<CustomListOfCategories> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoriesCubit, CategoriesState>(
      builder: (context, state) {
        if (state is CategoriesSuccessful) {
          return Container(
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
                    itemCount: state.categoriesEntity.data!.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          if (context.read<CategoriesTabCubit>().active != index) {
                            context.read<CategoriesTabCubit>().active = index;

                            setState(() {});
                          }
                          context.read<CategoriesTabCubit>().getCategoriesTab(
                              CategoriesTabParams(
                                  id: state
                                      .categoriesEntity.data![context.read<CategoriesTabCubit>().active].id));
                        },
                        child: Container(
                          color: context.read<CategoriesTabCubit>().active == index ? null : strokColor,
                          padding:
                              const EdgeInsets.only(left: 5, top: 5, bottom: 5),
                          child: Row(
                            children: [
                              Container(
                                decoration: context.read<CategoriesTabCubit>().active == index
                                    ? BoxDecoration(
                                        color: mainColor,
                                        borderRadius: BorderRadius.circular(12))
                                    : null,
                                width: 5,
                                height: 75,
                              ),
                              const CustomSpaceWidth(width: .01),
                              FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  state.categoriesEntity.data![index].name ??
                                      "",
                                  style: AppStyles.textMedium14(context),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  )));
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
