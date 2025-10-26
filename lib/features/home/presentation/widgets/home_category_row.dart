import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';

class HomeCategoryRow extends StatelessWidget {
  const HomeCategoryRow({super.key, required this.title, this.onSeeAllTap});

  final String title;
  final Function()? onSeeAllTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTextStyles.font20BlackSemiBold,
        ),
        GestureDetector(
          onTap: onSeeAllTap,
          child: Row(
            children: [
              Text(
                'see all',
                style: AppTextStyles.font114BlackMedium.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
              horizontalSpace(3),
              Icon(Icons.arrow_forward,
                  color: AppColors.primaryColor, size: 18.sp),
            ],
          ),
        )
      ],
    );
  }
}
