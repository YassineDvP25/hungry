import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hungry/core/routes/routes.dart';
import 'package:hungry/features/auth/login/cubit/login_cubit.dart';
import 'package:hungry/features/auth/login/view/login_screen.dart';
import 'package:hungry/features/auth/sign_up/cubit/sign_up_cubit.dart';
import 'package:hungry/features/auth/sign_up/view/sign_up_screen.dart';
import 'package:hungry/features/cart/view/cart_screen.dart';
import 'package:hungry/features/checkout/view/checkout_screen.dart';
import 'package:hungry/features/home/cubit/home_cubit.dart';
import 'package:hungry/features/home/view/home_screen.dart';
import 'package:hungry/features/product/view/product_detail_screen.dart';
import 'package:hungry/features/profile/view/profile_view.dart';
import 'package:hungry/route.dart';
import 'package:hungry/splash_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case Routes.loginScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => LoginCubit(),
                child: LoginScreen(),
              ),
        );
      case Routes.signUpScreen:
        return MaterialPageRoute(
          builder:
              (_) => BlocProvider(
                create: (context) => SignUpCubit(),
                child: SignUpScreen(),
              ),
        );
      case Routes.appRoute:
        return MaterialPageRoute(builder: (_) => AppRoute());
      case Routes.homeScreen:
        return MaterialPageRoute(
          builder:
              (_) =>  HomeScreen(),
              
        );
      case Routes.cartScreen:
        return MaterialPageRoute(builder: (_) => CartScreen());
      case Routes.checkoutScreen:
        return MaterialPageRoute(builder: (_) => CheckoutScreen());
      case Routes.profileScreen:
        return MaterialPageRoute(builder: (_) => ProfileScreen());
      case Routes.productDetailScreen:
        return MaterialPageRoute(builder: (_) => ProductDetailScreen());

      default:
        return null;
    }
  }
}
