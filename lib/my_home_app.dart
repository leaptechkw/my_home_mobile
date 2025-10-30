import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/routing/app_router.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:toastification/toastification.dart';

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key, required this.isDevelopment});
  final bool isDevelopment;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      child: ToastificationWrapper(
        child: MaterialApp.router(
          routerConfig: AppRouter.router,
          debugShowCheckedModeBanner: false,
          useInheritedMediaQuery: true,
          locale: DevicePreview.locale(context),
          builder: DevicePreview.appBuilder,
          theme: ThemeData(
            drawerTheme: DrawerThemeData(
              backgroundColor: AppColors.white,
            ),
            appBarTheme: AppBarTheme(
              elevation: 0,
              surfaceTintColor: Colors.grey.shade100,
              backgroundColor: Colors.grey.shade100,
            ),
            scaffoldBackgroundColor: Colors.grey.shade100,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              backgroundColor: Colors.grey.shade100,
            ),
          ),
        ),
      ),
    );
  }
}
