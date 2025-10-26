import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/utils/spacing.dart';

class HomeIntroContainer extends StatelessWidget {
  const HomeIntroContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 150.h,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
        image: DecorationImage(
          image: AssetImage('assets/images/home_intro.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'High quality sofa \nstarted',
            style: TextStyle(
              fontSize: 14.sp,
              color: Color(0xff4E5471),
              fontWeight: FontWeight.w500,
            ),
          ),
          verticalSpace(8),
          Expanded(
            child: Row(
              children: [
                Text(
                  '70%',
                  style: TextStyle(
                    fontSize: 1.sw > 500 ? 20.sp : 30.sp,
                    color: Color(0xff4E5471),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'off',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Color(0xff4E5471),
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
