import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_app/screen/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (context, child) {
        return GetMaterialApp(
          // this where the light mode colors are defined in
          debugShowCheckedModeBanner: false,
          title: 'Skiipe',
          theme: ThemeData(
            primaryColor: Colors.white,
            useMaterial3: true,
            primarySwatch: Colors.red,
            textTheme: Typography.englishLike2018
                .apply(fontSizeFactor: 1.sp, bodyColor: Colors.black),
            scaffoldBackgroundColor: Colors.white,
          ),
          home: child,
        );
      },
      child: HomeScreen(),

      // child: const Dummy(),
    );
  }
}
