import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';

class ProductDetailsRate extends StatelessWidget {
  const ProductDetailsRate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primaryColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Row(
        children: [
          Icon(Icons.star, color: AppColors.primaryColor, size: 16.sp),
          SizedBox(width: 4.w),
          Text(
            '4.5',
            style: AppTextStyles.font14BlackRegular
                .copyWith(color: AppColors.primaryColor),
          ),
        ],
      ),
    );
  }
}
