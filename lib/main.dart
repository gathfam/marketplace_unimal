import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app/config/routes/app_pages.dart';
import 'app/config/themes/app_theme.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return GetMaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            // primarySwatch: Colors.blue,

            textTheme: Typography.englishLike2018.apply(
                fontSizeFactor: 1.sp,
                bodyColor: Colors.black,
                displayColor: Colors.black),
          ),
          debugShowCheckedModeBanner: false, // Remove the debug banner
          initialRoute: AppPages.initial,
          getPages: AppPages.routes,
          home: Scaffold(
            // Using Scaffold to set background color
            backgroundColor: Color(0xFFFCFB), // Set background color here
            body: child,
          ),
        );
      },
    );
  }
}
