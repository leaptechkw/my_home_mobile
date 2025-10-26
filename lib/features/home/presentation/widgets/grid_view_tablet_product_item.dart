import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';

class GridViewTabletProductItem extends StatelessWidget {
  const GridViewTabletProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 280,
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
              height: 200,
              width: 200.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name',
                    style: AppTextStyles.font14BlackRegular.copyWith(
                      fontSize: 16.sp,
                      color: Colors.black54,
                    ),
                  ),
                  verticalSpace(6),
                  Text('\$99.99', style: AppTextStyles.font114BlackMedium),
                  verticalSpace(12),
                ],
              ),
            ),
          ),
          // 🖼️ image (uncommented + scaled)
          Positioned(
            top: 70,
            left: 12.w,
            right: 12.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(18.r),
              child: Image.asset(
                'assets/images/test.png',
                width: 200.w,
                fit: BoxFit.fitWidth,
                height: 180.h,
              ),
            ),
          ),
          // ❤️ favourite icon
          Positioned(
            top: 50.h,
            right: 24.w,
            child: Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.favorite_border,
                size: 18.w,
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
