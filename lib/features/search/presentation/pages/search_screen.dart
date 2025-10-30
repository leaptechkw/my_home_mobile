import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/core/widgets/app_text_field.dart';
import 'package:my_home/features/search/presentation/widgets/search_product_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();

  // Dummy product list
  final List<Map<String, dynamic>> dummyProducts = [
    {
      'name': 'Wooden Chair',
      'price': '49.99 KD',
      'image': 'assets/images/test.png',
    },
    {
      'name': 'Modern Sofa',
      'price': '199.99 KD',
      'image': 'assets/images/test.png',
    },
    {
      'name': 'Office Desk',
      'price': '29.99 KD',
      'image': 'assets/images/test.png',
    },
    {
      'name': 'Lamp Stand',
      'price': '39.99 KD',
      'image': 'assets/images/test.png',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Search Field
              AppTextField(
                controller: _searchController,
                hintText: 'Search for products...',
                prefixIcon: const Icon(Icons.search, color: Colors.grey),
              ),
              verticalSpace(20),

              /// Results label
              Text(
                'Results (${dummyProducts.length})',
                style: AppTextStyles.font14BlackRegular,
              ),
              verticalSpace(12),

              // / Product List
              Expanded(
                child: ListView.separated(
                  itemCount: dummyProducts.length,
                  separatorBuilder: (_, __) => verticalSpace(12),
                  itemBuilder: (context, index) {
                    final product = dummyProducts[index];
                    return SearchProductItem(product: product);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
