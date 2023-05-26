import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:news_getx/routes/app_pages.dart';
import 'package:news_getx/routes/router_name.dart';

import 'inject.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(builder: (context, child) {
      return GetMaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(),
        home: Container(),
        initialRoute: RouteName.home,
        getPages: AppPages.pages,
      );
    });
  }
}
