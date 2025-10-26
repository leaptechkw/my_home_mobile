import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';

class SearchProductItem extends StatelessWidget {
  const SearchProductItem({
    super.key,
    required this.product,
  });

  final Map<String, dynamic> product;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: EdgeInsets.all(8.w),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8.r),
          child: Image.asset(
            product['image'],
            width: 60.w,
            height: 60.w,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          product['name'],
          style: AppTextStyles.font14BlackRegular.copyWith(
            fontWeight: FontWeight.w500,
          ),
        ),
        subtitle: Text(
          product['price'],
          style: AppTextStyles.font14GreyRegular.copyWith(
            color: AppColors.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: Container(
          decoration: BoxDecoration(
              color: Colors.grey[100],
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(12.r)),
          child: IconButton(
            icon: SvgPicture.asset(
              'assets/svgs/cart.svg',
              width: 20.w,
              height: 20.h,
            ),
            color: AppColors.primaryColor,
            onPressed: () {},
          ),
        ),
        onTap: () {
          context.push('/productDetailsScreen');
        },
      ),
    );
  }
}
