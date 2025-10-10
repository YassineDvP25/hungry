import 'package:flutter/material.dart';
import 'package:hungry/core/routes/routes.dart';
import 'package:hungry/features/auth/view/login_screen.dart';
import 'package:hungry/features/auth/view/sign_up_screen.dart';
import 'package:hungry/features/cart/view/cart_screen.dart';
import 'package:hungry/features/checkout/view/checkout_screen.dart';
import 'package:hungry/features/home/view/home_screen.dart';
import 'package:hungry/features/profile/view/profile_view.dart';
import 'package:hungry/route.dart';
import 'package:hungry/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case Routes.signUpScreen:
        return MaterialPageRoute(builder: (_) => SignUpScreen());
      case Routes.appRoute:
        return MaterialPageRoute(builder: (_) => AppRoute());
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case Routes.checkoutScreen:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());

      default:
        return null;
    }
  }
}
