import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/routing/app_router.dart';
import 'package:my_home/core/services/shared_pref_service.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:toastification/toastification.dart';

void main() {
  //ensure initialization
  WidgetsFlutterBinding.ensureInitialized();
  //initialize screenutil
  ScreenUtil.ensureScreenSize();
  //shared pref init
  SharedPreferencesService().init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyHomeApp(),
    ),
  );
}

class MyHomeApp extends StatelessWidget {
  const MyHomeApp({super.key});

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
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.primaryColor,
              elevation: 0,
              foregroundColor: Colors.white,
            ),
            scaffoldBackgroundColor: Colors.grey.shade100,
          ),
        ),
      ),
    );
  }
}
