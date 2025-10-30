import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/app_text_field.dart';
import 'package:my_home/features/categories/presentation/widgets/category_container.dart';
import 'package:skeletonizer/skeletonizer.dart';

class CategoriesScreenBody extends StatelessWidget {
  const CategoriesScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          AppTextField(
            hintText: 'Search by Category...',
            borderColor: AppColors.primaryColor,
            prefixIcon: const Icon(
              Icons.search,
              color: Colors.grey,
            ),
          ),
          verticalSpace(20),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10.w,
                mainAxisSpacing: 10.h,
                childAspectRatio: 0.8,
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return CategoryContainer();
              },
            ),
          ),
        ],
      ),
    );
  }
}
