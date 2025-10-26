import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_home/core/services/shared_pref_service.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/app_button.dart';
import 'package:my_home/features/onboarding/presentation/widgets/page_view_column_texts.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  late final PageController _pageController;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      const PageViewColumnTexts(
        title: 'Welcome to MyHome',
        subTitle:
            'Your ultimate app for managing and organizing your home with ease and efficiency.',
      ),
      const PageViewColumnTexts(
        title: 'Discover Features',
        subTitle: 'Explore tools to simplify your daily home management.',
      ),
      const PageViewColumnTexts(
        title: 'Stay Organized',
        subTitle:
            'Keep track of tasks, bills, and home essentials effortlessly.',
      ),
      const PageViewColumnTexts(
        title: 'Get Started Now',
        subTitle: 'Let’s make your home smarter and more organized!',
      ),
    ];

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image

          Image.asset(
            'assets/images/onBoarding1.jpg',
            fit: BoxFit.cover,
            color: Colors.black.withOpacity(0.6),
            colorBlendMode: BlendMode.darken,
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                children: [
                  // Page indicators
                  SizedBox(
                    height: 15.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: pages.length,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        final isActive = index == _currentPage;
                        return AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: isActive ? 1.sw / 5 : 1.sw / 7,
                          height: 15.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: isActive
                                ? AppColors.white
                                : Colors.white.withOpacity(0.3),
                          ),
                        );
                      },
                    ),
                  ),

                  verticalSpace(50.h),

                  // PageView
                  Expanded(
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: pages.length,
                      onPageChanged: (index) {
                        setState(() => _currentPage = index);
                      },
                      itemBuilder: (context, index) => pages[index],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Bottom button
          Positioned(
            bottom: 40.h,
            left: 0,
            right: 0,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: AppButton(
                buttonText:
                    _currentPage == pages.length - 1 ? 'Get Started' : 'Next',
                onPressed: () {
                  if (_currentPage < pages.length - 1) {
                    _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.linear,
                    );
                  } else {
                    SharedPreferencesService().saveData('onBoardingDone', true);
                    context.pushReplacement('/login');
                  }
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
