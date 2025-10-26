import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';

class GridViewMobilePrdouctItem extends StatelessWidget {
  const GridViewMobilePrdouctItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 208,
      child: Stack(
        children: [
          // Card container
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
              height: 150,
              width: 157.w,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Product Name',
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        color: Colors.black54,
                      )),
                  verticalSpace(4),
                  Text('\$99.99', style: AppTextStyles.font14BlackRegular),
                  verticalSpace(12),
                ],
              ),
            ),
          ),
          // 🖼️ image
          Positioned(
            top: 0.h,
            left: 8.w,
            right: 8.w,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16.r),
              child: Image.asset(
                'assets/images/test.png',
                width: 157.w,
                fit: BoxFit.fitWidth,
                height: 150.h,
              ),
            ),
          ),
          // ❤️ favourite icon
          Positioned(
            top: 10.h,
            right: 20.w,
            child: GestureDetector(
              onTap: () {
                // Handle favorite button tap
              },
              child: Container(
                padding: EdgeInsets.all(6.w),
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  Icons.favorite_border,
                  size: 16.w,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
