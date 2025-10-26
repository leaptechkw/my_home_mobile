import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/features/home/presentation/widgets/home_app_bar.dart';
import 'package:my_home/features/home/presentation/widgets/home_category_list_view.dart';
import 'package:my_home/features/home/presentation/widgets/home_category_row.dart';
import 'package:my_home/features/home/presentation/widgets/home_grid_view_builder.dart';
import 'package:my_home/features/home/presentation/widgets/home_intro_container.dart';

class HomeScreenBody extends StatelessWidget {
  const HomeScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              onSeeAllTap: () {},
            ),
            verticalSpace(10),
            const HomeCategoryListView(),
            verticalSpace(10),

            /// Popular Section
            HomeCategoryRow(
              title: 'Popular',
              onSeeAllTap: () {},
            ),
            verticalSpace(20),

            /// Grid
            HomeGridViewBuilder(),
          ],
        ),
      ),
    );
  }
}
