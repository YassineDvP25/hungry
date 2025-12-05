import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/constants/app_colors.dart';
import 'package:hungry/features/auth/login/view/login_screen.dart';
import 'package:hungry/features/home/view/home_screen.dart'; // أو أي شاشة البداية لديك

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoController;
  late AnimationController _imageController;

  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();

    /// أنيميشن النص
    _logoController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _logoController, curve: Curves.easeIn),
    );
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 0.3), end: Offset.zero)
        .animate(CurvedAnimation(parent: _logoController, curve: Curves.easeOut));

    /// أنيميشن الصورة
    _imageController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _scaleAnimation = Tween<double>(begin: 0.8, end: 1.0).animate(
      CurvedAnimation(parent: _imageController, curve: Curves.elasticOut),
    );

    /// بدء الأنيميشن بالتتابع
    _logoController.forward().then((_) {
      _imageController.forward();
    });

    /// الانتقال التلقائي بعد 4 ثوانٍ
    Future.delayed(const Duration(seconds: 4), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => LoginScreen()),
      );
    });
  }

  @override
  void dispose() {
    _logoController.dispose();
    _imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              /// مسافة قبل النص
              Gap(200.h),

              /// نص "HUNGRY?" مع Fade و Slide
              FadeTransition(
                opacity: _fadeAnimation,
                child: SlideTransition(
                  position: _slideAnimation,
                  child: SvgPicture.asset(
                    'assets/logo/hungry_text.svg',
                    width: 250.w,
                  ),
                ),
              ),

              const Spacer(),

              /// أنيميشن الصورة (تكبير تدريجي)
              ScaleTransition(
                scale: _scaleAnimation,
                child: Image.asset(
                  'assets/burger/burger7.png',
                  // width: 250.w,
                ),
              ),

              Gap(10.h),
            ],
          ),
        ),
      ),
    );
  }
}
