

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/routes/app_router.dart';
import 'package:hungry/core/routes/routes.dart';

class HungryApp extends StatelessWidget {
  final AppRouter approuter;
  const HungryApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
  
    return ScreenUtilInit(
      designSize: Size(375, 812),

      child: MaterialApp(
      
        initialRoute: Routes.appRoute,

        debugShowCheckedModeBanner: false,
        onGenerateRoute: approuter.generateRoute,
      ),
    );
  }
}
