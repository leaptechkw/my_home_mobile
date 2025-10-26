import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:my_home/core/widgets/square_button.dart';

class ProductDetailsAppBar extends StatelessWidget {
  const ProductDetailsAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      child: Stack(
        children: [
          Image.asset(
            'assets/images/test2.png',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Positioned(
            top: 50.h,
            left: 16.w,
            right: 16.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SquareButton(
                  icon: Icons.arrow_back_ios_new,
                  selectedColor: Colors.black,
                  unselectedColor: Colors.black,
                  onTap: () {
                    context.pop();
                  },
                  isSelected: false,
                ),
                SquareButton(
                  icon: Icons.share,
                  onTap: () {
                    // Handle favorite button tap
                  },
                  isSelected: false,
                  unselectedColor: Colors.black,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
