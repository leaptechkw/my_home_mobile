import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/features/categories/presentation/widgets/categories_app_bar.dart';
import 'package:my_home/features/categories/presentation/widgets/categories_screen_body.dart';
import 'package:my_home/features/home/presentation/widgets/home_app_bar.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CategoriesAppBar(),
      ),
      body: CategoriesScreenBody(),
    );
  }
}
