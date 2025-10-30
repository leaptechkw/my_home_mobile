import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_text_styles.dart';

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      width: double.infinity,
      height: 140.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          opacity: 0.9,
          fit: BoxFit.cover,
          image: AssetImage(
            'assets/images/test2.png',
          ),
        ),
      ),
      child: Center(
        child: Text(
          'Sofa',
          style: AppTextStyles.font32WhiteBold,
        ),
      ),
    );
  }
}
