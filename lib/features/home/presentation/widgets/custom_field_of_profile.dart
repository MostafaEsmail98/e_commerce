import 'package:flutter/material.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/custom_space_height.dart';
import '../../../../core/utils/k_colors.dart';

class CustomFieldOfProfile extends StatelessWidget {
  const CustomFieldOfProfile({
    super.key, required this.title, required this.content
  });
  final String title ;
  final String content ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textMedium20(context),
        ),
        const CustomSpaceHeight(height: .01),
        Container(
          height: 60,
          width: double.maxFinite,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: strokColor)),
          child: ListTile(
            title: Text(
              content,
              style: AppStyles.textMedium14(context),
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.edit),
          ),
        ),
        const CustomSpaceHeight(height: .03)
      ],
    );
  }

}
