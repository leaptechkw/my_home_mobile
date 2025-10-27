import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/square_button.dart';
import 'package:my_home/features/cart/presentation/widgets/quantity_button.dart';

class CartProductItem extends StatelessWidget {
  const CartProductItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 80.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            //main row
            child: Row(
              children: [
                // product image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: Image.asset('assets/images/test.png'),
                ),
                horizontalSpace(8),
                //product name , qty , button
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'product name',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.font12BlackRegular,
                      ),
                      Text(
                        'Qty: 1',
                      ),
                      //qty buttons
                      Row(
                        children: [
                          QuantityButton(
                            icon: Icons.add,
                            onTap: () {},
                          ),
                          horizontalSpace(5),
                          Text('1'),
                          horizontalSpace(5),
                          QuantityButton(icon: Icons.remove, onTap: () {}),
                        ],
                      ),
                    ],
                  ),
                ),
                //delte button and price
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QuantityButton(
                      icon: Icons.delete,
                      iconColor: Colors.redAccent,
                      onTap: () {},
                    ),
                    Text(
                      '\$99.99',
                      style: AppTextStyles.font14BlackRegular.copyWith(
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Divider(),
        ],
      ),
    );
  }
}
