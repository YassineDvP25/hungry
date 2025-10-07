import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/components/text_form_field.dart';
import 'package:hungry/features/auth/components/top_bar.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Burger Background Image
          Image.asset(
            "assets/burger/how was your day_ 💕 😊.jpeg", // ضع صورة الساندويتش هنا
            fit: BoxFit.cover,
          ),

          Container(color: Colors.black.withValues(alpha: 0.7)),

          /// auth
          SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 22.0).r,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  TopBar(
                    title: 'Create Account',
                    subtitle: ' Welcome to a culinary journey like no other!',
                  ),
                  Gap(30.h),

                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Name Field
                        AuthTextFormField(
                          controller: _emailController,
                          labelText: 'Name',
                          icon: Icons.person_outline,
                          validator: (value) {
                            return nameValidation(value);
                          },
                          obscureText: false,
                        ),
                        Gap(14.h),
                        // Email Field
                        AuthTextFormField(
                          controller: _emailController,
                          labelText: 'Email',
                          icon: Icons.email_outlined,
                          validator: (value) {
                            return emailValidation(value);
                          },
                          obscureText: false,
                        ),
                        Gap(14.h),
                        // Phone Field
                        AuthTextFormField(
                          controller: _emailController,
                          labelText: 'Phone',
                          icon: Icons.phone_outlined,
                          validator: (value) {
                            return phoneValidation(value);
                          },
                          obscureText: false,
                        ),
                        Gap(14.h),

                        /// Pssword Field
                        AuthTextFormField(
                          controller: _passwordController,
                          labelText: 'Password',
                          icon: Icons.lock_outline,
                          suffixIcon: IconButton(
                            icon: Icon(
                              _obscurePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                _obscurePassword = !_obscurePassword;
                              });
                            },
                          ),
                          validator: (value) {
                            return passwordValidation(value);
                          },
                          obscureText: _obscurePassword,
                        ),

                      ],
                    ),
                  ),

                  Gap(30.h),

                  /// Login Button
                  SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF004D25),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          Navigator.pushReplacementNamed(context, "/home");
                        }
                      },
                      child: Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),

                  Gap(14),

                  /// Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, "/loginScreen");
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.greenAccent,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Gap(40.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
