import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          children: [
            Gap(350),

            SvgPicture.asset('assets/logo/hungry_text.svg'),
            Spacer(),
            Image.asset('assets/splash/burger.png'),
          ],
        ),
      ),
    );
  }
}
