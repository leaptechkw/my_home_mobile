import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Stack(
            alignment: Alignment.center,
            children: [
              /// Animated logo
              const LoginAnimatedLogo(),

              /// Login form
              Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 16.w, top: 200.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Login',
                        style: AppTextStyles.font20BlackBold.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      ),
                      verticalSpace(30),

                      /// Email field
                      AppTextFormField(
                        hintText: 'Email',
                        labelText: 'Email',
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 10.h),

                      /// Password field
                      AppTextFormField(
                        hintText: 'Password',
                        labelText: 'Password',
                        obscureText: obsecureText,
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obsecureText = !obsecureText;
                            });
                          },
                          child: Icon(
                            obsecureText
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                      ),

                      verticalSpace(20),

                      /// Login button
                      AppButton(
                        buttonText: 'Login',
                        onPressed: () {},
                      ),

                      verticalSpace(20),

                      const OrDivider(),
                      verticalSpace(20),

                      /// Secondary buttons
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              buttonText: 'Login as guest',
                              onPressed: () {
                                context.pushReplacement('/mainScaffold');
                              },
                              height: 40.h,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                          horizontalSpace(10),
                          Expanded(
                            child: AppButton(
                              buttonText: 'Sign up',
                              onPressed: () {
                                context.push('/signUp');
                              },
                              backgroundColor: AppColors.secondaryColor,
                              textColor: AppColors.primaryColor,
                              height: 40.h,
                              borderRadius: BorderRadius.circular(50.r),
                            ),
                          ),
                        ],
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
        ),
      ),
    );
  }
}
