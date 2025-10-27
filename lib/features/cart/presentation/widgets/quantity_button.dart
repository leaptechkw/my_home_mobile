import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';

class QuantityButton extends StatelessWidget {
  const QuantityButton({
    super.key,
    required this.icon,
    this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final Color? iconColor;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 24.w,
        height: 24.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          shape: BoxShape.rectangle,
          border: BoxBorder.all(
            color: AppColors.primaryColor,
          ),
        ),
        child: Icon(
          icon,
          color: iconColor ?? AppColors.primaryColor,
          size: 18,
        ),
      ),
    );
  }
}
