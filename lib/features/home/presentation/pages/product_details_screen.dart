import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/my_toast.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/app_button.dart';
import 'package:my_home/core/widgets/square_button.dart';
import 'package:my_home/features/home/presentation/widgets/product_details/product_details_app_bar.dart';
import 'package:my_home/features/home/presentation/widgets/product_details/product_details_rate.dart';
import 'package:my_home/features/home/presentation/widgets/product_details/product_details_text_select.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late PageController pageController;
  int currentPageIndex = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    pageController = PageController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          /// Background (e.g., hero image or custom header)
          // to ensure the app bar is on top
          Positioned.fill(
            child: const ProductDetailsAppBar(),
          ),

          /// Main content card that fills remaining space
          Positioned(
            top: 300.h - 40.h, // Overlap a bit with header
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(16.w),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24.r),
                  topRight: Radius.circular(24.r),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 8,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              //product details content
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Product Name',
                    style: AppTextStyles.font20BlackBold,
                  ),
                  verticalSpace(8),
                  Row(
                    children: [
                      Text(
                        '\$99.99',
                        style: AppTextStyles.font20BlackSemiBold
                            .copyWith(color: AppColors.primaryColor),
                      ),
                      Spacer(),
                      ProductDetailsRate(),
                    ],
                  ),
                  verticalSpace(30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ProductDetailsTextSelect(
                        text: 'Description',
                        isSelected: currentPageIndex == 0,
                        onTap: () {
                          // Handle tap
                          setState(() {
                            currentPageIndex = 0;
                          });
                          pageController.animateToPage(
                            0,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      ProductDetailsTextSelect(
                        text: 'Materials',
                        isSelected: currentPageIndex == 1,
                        onTap: () {
                          setState(() {
                            currentPageIndex = 1;
                          });
                          pageController.animateToPage(
                            1,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                      ProductDetailsTextSelect(
                        text: 'Reviews',
                        isSelected: currentPageIndex == 2,
                        onTap: () {
                          setState(() {
                            currentPageIndex = 2;
                          });
                          // Handle tap
                          pageController.animateToPage(
                            2,
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        },
                      ),
                    ],
                  ),
                  verticalSpace(20),
                  Expanded(
                    child: PageView(
                      onPageChanged: (index) {
                        setState(() {
                          currentPageIndex = index;
                        });
                      },
                      controller: pageController,
                      children: [
                        Text(
                          'This is a detailed description of the product. It highlights key features, materials used, and other relevant information that helps the customer make an informed decision about their purchase.',
                          style: AppTextStyles.font14GreyRegular,
                        ),
                        Text(
                          'Materials information will be displayed here.',
                          style: AppTextStyles.font14GreyRegular,
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SquareButton(
                        icon: Icons.favorite_sharp,
                        onTap: () {
                          // Handle favorite button tap
                        },
                        unselectedColor: Color(0xff121212),
                        selectedColor: Colors.redAccent,
                        isSelected: false,
                      ),
                      horizontalSpace(10),
                      Expanded(
                        child: AppButton(
                          buttonText: 'Add to cart',
                          backgroundColor: Color(0xff121212),
                          onPressed: () {
                            MyToast.success(context, 'Added to Cart',
                                description:
                                    'This item has been added to your cart.');
                          },
                        ),
                      ),
                    ],
                  ),
                  verticalSpace(20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
