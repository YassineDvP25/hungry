import 'package:flutter/material.dart';
import 'package:hungry/core/routes/routes.dart';
import 'package:hungry/features/auth/view/login_screen.dart';
import 'package:hungry/features/auth/view/sign_up_screen.dart';
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

      default:
        return null;
    }
  }
}
