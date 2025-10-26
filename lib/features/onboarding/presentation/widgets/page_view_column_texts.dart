import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';

class PageViewColumnTexts extends StatelessWidget {
  const PageViewColumnTexts({
    super.key,
    required this.title,
    required this.subTitle,
  });
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTextStyles.font32WhiteBold),
        verticalSpace(16.h),
        Text(
          subTitle,
          style: AppTextStyles.font16WhiteBold.copyWith(
            color: AppColors.primaryColor,
          ),
        ),
      ],
    );
  }
}
