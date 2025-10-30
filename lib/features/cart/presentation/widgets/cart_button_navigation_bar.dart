import 'package:flutter/material.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/app_button.dart';

class CartBottomNavigationBar extends StatelessWidget {
  const CartBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Divider(),
          verticalSpace(10),
          Row(
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Total:', style: AppTextStyles.font14BlackRegular),
                  Text(
                    '600 KD',
                    style: AppTextStyles.font114BlackMedium
                        .copyWith(color: AppColors.primaryColor),
                  ),
                ],
              ),
              horizontalSpace(10),
              Expanded(
                  child: AppButton(
                buttonText: 'Proceed to Checkout',
                onPressed: () {},
                backgroundColor: Color(0xff121212),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
