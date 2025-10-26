import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:my_home/core/themes/app_text_styles.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore What ',
              style: AppTextStyles.font24BlackSemiBold,
            ),
            Text(
              'Your Home Needs',
              style: AppTextStyles.font24BlackSemiBold,
            )
          ],
        ),
        Spacer(),
        SvgPicture.asset(
          'assets/svgs/ring.svg',
          width: 24.w,
          height: 24.h,
        ),
      ],
    );
  }
}
