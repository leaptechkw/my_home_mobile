import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/features/home/presentation/widgets/custom_drawer.dart';
import 'package:my_home/features/home/presentation/widgets/home_app_bar.dart';
import 'package:my_home/features/home/presentation/widgets/home_category_list_view.dart';
import 'package:my_home/features/home/presentation/widgets/home_category_row.dart';
import 'package:my_home/features/home/presentation/widgets/home_grid_view_builder.dart';
import 'package:my_home/features/home/presentation/widgets/home_intro_container.dart';

class HomeScreenBody extends StatefulWidget {
  const HomeScreenBody({super.key});

  @override
  State<HomeScreenBody> createState() => _HomeScreenBodyState();
}

class _HomeScreenBodyState extends State<HomeScreenBody> {
  late ScrollController _scrollController;
  bool _showHelpButton = false;
  double _lastTriggerOffset = 0; // لتجنب التكرار المتواصل

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    _scrollController.addListener(() {
      final screenHeight = MediaQuery.of(context).size.height;
      final offset = _scrollController.offset;

      // إذا تجاوز المستخدم 5 شاشات إضافية من آخر مرة
      if (offset - _lastTriggerOffset > 5 * screenHeight) {
        _lastTriggerOffset = offset;
        _showHelpTemporarily();
      }

      // ✅ إذا عاد المستخدم للأعلى (قريب من التوب)
      if (offset < screenHeight) {
        _lastTriggerOffset = 0;
      }
    });
  }

  void _showHelpTemporarily() {
    if (!_showHelpButton) {
      setState(() => _showHelpButton = true);

      // بعد 8 ثواني، أخفي الزر
      Timer(const Duration(seconds: 8), () {
        if (mounted) {
          setState(() => _showHelpButton = false);
        }
      });
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),

      body: SingleChildScrollView(
        controller: _scrollController,
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HomeAppBar(),
            verticalSpace(20),
            const HomeIntroContainer(),
            verticalSpace(10),

            /// Categories
            HomeCategoryRow(
              title: 'Categories',
              onSeeAllTap: () {
                context.push('/categoriesScreen');
              },
            ),
            verticalSpace(10),
            HomeCategoryListView(),
            verticalSpace(10),

            /// Popular Section
            HomeCategoryRow(
              title: 'Stages',
              onSeeAllTap: () {},
            ),
            verticalSpace(20),

            /// Grid
            HomeGridViewBuilder(),
          ],
        ),
      ),

      /// الزر العائم
      floatingActionButton: _showHelpButton
          ? FloatingActionButton.extended(
              backgroundColor: AppColors.primaryColor,
              onPressed: () {
                context.push('/aiChatScreen');
              },
              label: Row(
                children: [
                  SvgPicture.asset(
                    'assets/svgs/brain.svg',
                    width: 25.w,
                    height: 25.h,
                    color: Colors.white,
                  ),
                  horizontalSpace(10),
                  Text(
                    'Want any help ?',
                    style: AppTextStyles.font14WhiteMedium,
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
