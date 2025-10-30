import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';

class HomeCategoryListView extends StatelessWidget {
  HomeCategoryListView({super.key});

  // Dummy category list
  final List<Map<String, String>> dummyList = [
    {'name': 'Chairs', 'image': 'assets/images/chair.png'},
    {'name': 'Sofas', 'image': 'assets/images/sofa.png'},
    {'name': 'Beds', 'image': 'assets/images/bed.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: dummyList.length,
        itemBuilder: (context, index) {
          final item = dummyList[index];
          return Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: Container(
              padding: EdgeInsets.all(8),
              width: 125.w,
              height: 60.h,
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(16.r),
              ),
              child: Row(
                children: [
                  Text(
                    item['name']!,
                    style: AppTextStyles.font14WhiteMedium,
                  ),
                  const Spacer(),
                  Image.asset(
                    item['image']!,
                    width: 50.w,
                    height: 50.h,
                    fit: BoxFit.contain,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
