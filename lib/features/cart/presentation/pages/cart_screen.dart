import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/app_button.dart';
import 'package:my_home/features/cart/presentation/widgets/cart_app_bar.dart';
import 'package:my_home/features/cart/presentation/widgets/cart_button_navigation_bar.dart';
import 'package:my_home/features/cart/presentation/widgets/cart_screen_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(56.h),
        child: CartAppBar(),
      ),
      body: CartScreenBody(),
      bottomNavigationBar: CartBottomNavigationBar(),
    );
  }
}
