import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/widgets/square_button.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //for center the title
            Opacity(
              opacity: 0,
              child: Icon(
                Icons.delete,
                size: 28.sp,
              ),
            ),
            Text(
              'Cart',
              style: AppTextStyles.font20BlackBold,
            ),
            SquareButton(
              icon: Icons.delete,
              onTap: () {},
              isSelected: true,
              selectedColor: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
