import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/widgets/square_button.dart';

class CategoriesAppBar extends StatelessWidget {
  const CategoriesAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
        ),
        child: AppBar(
          centerTitle: true,
          title: Text(
            'Categories',
            style: AppTextStyles.font20BlackBold,
          ),
          leading: SquareButton(
            icon: Icons.arrow_back_ios_new_outlined,
            isSelected: false,
            onTap: () {
              context.pop();
            },
            unselectedColor: Colors.black,
          ),
        ),
      ),
    );
  }
}
