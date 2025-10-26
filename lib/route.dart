// import 'package:flutter/material.dart';
// import 'package:hungry/core/routes/routes.dart';
// import 'package:hungry/core/widgets/app_bottom_app_bar.dart';
// import 'package:hungry/features/cart/view/cart_screen.dart';
// import 'package:hungry/features/checkout/view/checkout_screen.dart';
// import 'package:hungry/features/home/view/home_screen.dart';
// import 'package:hungry/features/profile/view/profile_view.dart';

// class AppRoute extends StatefulWidget {
//   const AppRoute({super.key});

//   @override
//   State<AppRoute> createState() => _AppRouteState();
// }

// class _AppRouteState extends State<AppRoute> {
//   PageController controller = PageController();
//   List<Widget> routes = [
//     HomeScreen(),
//     CartScreen(),
//     CheckoutScreen(),
//     ProfileScreen(),
//   ];

//   @override
//   Widget build(BuildContext context) {

//     return Scaffold(

//       body: PageView(controller: controller, children: routes),
//       bottomNavigationBar: ClipRRect(
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(25),
//           topRight: Radius.circular(25),
//         ),
//         child: AppBottomAppBar(controller: controller,),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
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
  final PageController controller = PageController();

  /// 🟢 هذا المتغير لتتبع الصفحة الحالية
  int _selectedIndex = 0;

  /// 🟢 الصفحات
  final List<Widget> routes = const [
    HomeScreen(),
    CartScreen(),
    CheckoutScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _selectedIndex == 3 ? Color(0xff08431D) : Colors.white ,
      body: PageView(
        controller: controller,
        children: routes,
        onPageChanged: (index) {
          /// 🟢 تحديث الـ selectedIndex عندما يمرر المستخدم بين الصفحات
          setState(() {
            _selectedIndex = index;
          });
        },
      ),

      /// 🟢 تمرير الـ controller و _selectedIndex إلى الـ BottomAppBar
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
        child: AppBottomAppBar(controller: controller),
      ),
    );
  }
}
