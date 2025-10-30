import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';

class LoginAnimatedLogo extends StatelessWidget {
  const LoginAnimatedLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        MoveEffect(
          begin: const Offset(0, 0), // start in center
          end: Offset(0, -180.h), // move slightly up
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        ),
        ScaleEffect(
          begin: const Offset(1.3, 1.3),
          end: const Offset(1, 1),
          duration: const Duration(seconds: 2),
          curve: Curves.easeInOut,
        ),
      ],
      child: Image.asset(
        'assets/images/logo.png',
        width: 200.w,
        height: 200.h,
        color: AppColors.white,
      ),
    );
  }
}
