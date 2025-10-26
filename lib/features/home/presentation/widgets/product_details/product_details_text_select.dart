import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';

class ProductDetailsTextSelect extends StatelessWidget {
  const ProductDetailsTextSelect({
    super.key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primaryColor.withOpacity(0.2)
              : AppColors.geryLight.withOpacity(0.9),
          borderRadius: BorderRadius.circular(10.r),
        ),
        child: Text(
          text,
          style: AppTextStyles.font14BlackRegular,
        ),
      ),
    );
  }
}
