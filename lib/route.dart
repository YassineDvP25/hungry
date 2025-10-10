import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/widgets/app_bottom_app_bar.dart';
import 'package:hungry/features/cart/view/cart_screen.dart';
import 'package:hungry/features/checkout/view/checkout_screen.dart';
import 'package:hungry/features/home/view/home_screen.dart';
import 'package:hungry/features/profile/view/profile_view.dart';

class AppRoute extends StatefulWidget {
  const AppRoute({super.key});

  @override
  State<AppRoute> createState() => _AppRouteState();
}

class _AppRouteState extends State<AppRoute> {
  PageController controller = PageController();
  List<Widget> routes = [
    HomeScreen(),
    CartScreen(),
    CheckoutScreen(),
    ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: controller, children: routes),
      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: AppBottomAppBar(controller: controller ) ,
      ),
    );
  }
}
