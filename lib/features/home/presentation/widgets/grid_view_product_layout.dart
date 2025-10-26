import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/core/themes/app_text_styles.dart';
import 'package:my_home/core/utils/spacing.dart';
import 'package:my_home/features/home/presentation/widgets/grid_view_movbile_product_item.dart';
import 'package:my_home/features/home/presentation/widgets/grid_view_tablet_product_item.dart';

class GridViewProductLayout extends StatelessWidget {
  const GridViewProductLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.minWidth < 300 && constraints.maxWidth < 500) {
          return GridViewMobilePrdouctItem();
        }
        // 💻 iPad or larger screen layout
        else {
          return GridViewTabletProductItem();
        }
      },
    );
  }
}
