import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/routes/app_router.dart';
import 'package:hungry/core/routes/routes.dart';
import 'package:hungry/features/cart/view/cart_screen.dart';
import 'package:hungry/features/checkout/view/checkout_screen.dart';
import 'package:hungry/features/home/view/home_screen.dart';
import 'package:hungry/features/profile/view/profile_view.dart';

class HungryApp extends StatelessWidget {
  final AppRouter approuter;
  const HungryApp({super.key, required this.approuter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(375, 812),

      child: MaterialApp(
        initialRoute: Routes.loginScreen,
        routes: {
          Routes.homeScreen: (context) => HomeScreen(),
          Routes.cartScreen: (context) => CartScreen(),
          Routes.checkoutScreen: (context) => CheckoutScreen(),
          Routes.profileScreen: (context) => ProfileScreen(),
        },
      
        debugShowCheckedModeBanner: false,
        onGenerateRoute: approuter.generateRoute,
      ),
    );
  }
}
