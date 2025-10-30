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
  late final PageController _textController;
  late final PageController _backgroundController;
  int _currentPage = 0;

  final List<String> imagePath = [
    'assets/images/onBoarding1.jpg',
    'assets/images/onBoarding2.png',
    'assets/images/onBoarding3.png',
    'assets/images/onBoarding4.jpg',
  ];

  final List<Widget> pages = const [
    PageViewColumnTexts(
      title: 'Welcome to MyHome',
      subTitle:
          'Your ultimate app for managing and organizing your home with ease and efficiency.',
    ),
    PageViewColumnTexts(
      title: 'Discover Features',
      subTitle: 'Explore tools to simplify your daily home management.',
    ),
    PageViewColumnTexts(
      title: 'Stay Organized',
      subTitle: 'Keep track of tasks, bills, and home essentials effortlessly.',
    ),
    PageViewColumnTexts(
      title: 'Get Started Now',
      subTitle: 'Let’s make your home smarter and more organized!',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _textController = PageController();
    _backgroundController = PageController();

    // Sync background with text PageView
    _textController.addListener(() {
      if (_backgroundController.hasClients) {
        _backgroundController.position.jumpTo(_textController.position.pixels);
      }
    });
  }

  @override
  void dispose() {
    _textController.dispose();
    _backgroundController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background images PageView
          PageView.builder(
            controller: _backgroundController,
            itemCount: imagePath.length,
            physics: const NeverScrollableScrollPhysics(), // only scroll text
            itemBuilder: (context, index) {
              return Image.asset(
                imagePath[index],
                fit: BoxFit.cover,
                color: Colors.black.withOpacity(0.6),
                colorBlendMode: BlendMode.darken,
              );
            },
          ),

          // Foreground content
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0.w),
              child: Column(
                children: [
                  // Page indicators
                  SizedBox(
                    height: 15.h,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        pages.length,
                        (i) => AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: EdgeInsets.symmetric(horizontal: 5.w),
                          width: i == _currentPage ? 1.sw / 5 : 1.sw / 7,
                          height: 15.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.r),
                            color: i == _currentPage
                                ? AppColors.white
                                : Colors.white.withOpacity(0.3),
                          ),
                        ),
                      ),
                    ),
                  ),

                  verticalSpace(50.h),

                  // Text PageView
                  Expanded(
                    child: PageView.builder(
                      controller: _textController,
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

          // Bottom fixed button
          Positioned(
            bottom: 40.h,
            left: 16.w,
            right: 16.w,
            child: AppButton(
              buttonText:
                  _currentPage == pages.length - 1 ? 'Get Started' : 'Next',
              onPressed: () {
                if (_currentPage < pages.length - 1) {
                  _textController.nextPage(
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
        ],
      ),
    );
  }
}
