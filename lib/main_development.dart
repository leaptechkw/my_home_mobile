import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_home/core/routing/app_router.dart';
import 'package:my_home/core/services/shared_pref_service.dart';
import 'package:my_home/core/themes/app_colors.dart';
import 'package:my_home/my_home_app.dart';
import 'package:toastification/toastification.dart';

void main() async {
  print('development');
  //ensure initialization
  WidgetsFlutterBinding.ensureInitialized();
  //initialize screenutil
  await ScreenUtil.ensureScreenSize();
  //shared pref init
  SharedPreferencesService().init();
  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MyHomeApp(
        isDevelopment: true,
      ),
    ),
  );
}
