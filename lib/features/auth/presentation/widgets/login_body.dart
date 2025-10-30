import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/app_button.dart';
import 'package:my_home/core/widgets/app_text_form_field.dart';
import 'package:my_home/features/auth/presentation/widgets/login_animated_logo.dart';
import 'package:my_home/features/auth/presentation/widgets/or_divider.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({super.key});

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  bool obsecureText = true;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          //Background image
          Positioned.fill(
            child: Image.asset(
              'assets/images/onBoarding1.jpg',
              fit: BoxFit.cover,
              color: Colors.black.withOpacity(0.6),
              colorBlendMode: BlendMode.darken,
            ),
          ),

          /// Animated logo
          Positioned(
            left: 0,
            right: 0,
            top: 300.h,
            child: const LoginAnimatedLogo(),
          ),

          /// Login form
          Align(
            alignment: Alignment.center,
            child: Padding(
              padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 100.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Sign in',
                    style: AppTextStyles.font20BlackBold.copyWith(
                      color: AppColors.white,
                    ),
                  ),
                  verticalSpace(30),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.all(8),
                        backgroundColor: Colors.black),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/apple.svg',
                          color: Colors.white,
                          width: 30.w,
                          height: 30.h,
                        ),
                        horizontalSpace(10),
                        Text(
                          'Sign in with Apple',
                          style: AppTextStyles.font16WhiteBold,
                        ),
                      ],
                    ),
                  ),

                  verticalSpace(20),

                  /// Login button
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(8),
                      backgroundColor: const Color.fromARGB(255, 140, 29, 21),
                    ),
                    onPressed: () {},
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          'assets/svgs/google.svg',
                          width: 30.w,
                          height: 30.h,
                        ),
                        horizontalSpace(10),
                        Text(
                          'Sign in with Google',
                          style: AppTextStyles.font16WhiteBold,
                        ),
                      ],
                    ),
                  ),

                  verticalSpace(20),
                  // const OrDivider(),
                  // verticalSpace(20),

                  // /// Secondary buttons
                  // Row(
                  //   children: [
                  //     Expanded(
                  //       child: AppButton(
                  //         buttonText: 'Login as guest',
                  //         onPressed: () {
                  //           context.pushReplacement('/mainScaffold');
                  //         },
                  //         height: 40.h,
                  //         borderRadius: BorderRadius.circular(50.r),
                  //       ),
                  //     ),
                  //     horizontalSpace(10),
                  //     Expanded(
                  //       child: AppButton(
                  //         buttonText: 'Sign up',
                  //         onPressed: () {
                  //           context.push('/signUp');
                  //         },
                  //         backgroundColor: AppColors.secondaryColor,
                  //         textColor: AppColors.primaryColor,
                  //         height: 40.h,
                  //         borderRadius: BorderRadius.circular(50.r),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        context.pushReplacement('/mainScaffold');
                      },
                      child: Text(
                        'Sign in as guest',
                        style: AppTextStyles.font16WhiteBold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ).animate().fade(
                delay: const Duration(seconds: 1),
                duration: const Duration(seconds: 1),
              ),
        ],
      ),
    );
  }
}
