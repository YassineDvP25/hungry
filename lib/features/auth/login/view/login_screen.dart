import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/routes/routes.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/components/text_form_field.dart';
import 'package:hungry/features/auth/components/top_bar.dart';
import 'package:hungry/features/auth/login/cubit/login_cubit.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Burger Background Image
          Image.asset("assets/burger/burger12.jpeg", fit: BoxFit.cover),

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
                    title: 'Welcome back 👋',
                    subtitle: ' Welcome to a culinary journey like no other!',
                  ),
                  Gap(40.h),

                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return Form(
                        key: context.read<LoginCubit>().formKey,
                        child: Column(
                          children: [
                            // Name Field
                            AuthTextFormField(
                              controller:
                                  context.read<LoginCubit>().nameController,
                              labelText: 'Name',
                              icon: Icons.person_2_outlined,
                              validator: (value) {
                                return nameValidation(value);
                              },
                              obscureText: false,
                            ),
                            Gap(14.h),
                            // Email Field
                            AuthTextFormField(
                              controller:
                                  context.read<LoginCubit>().emailController,
                              labelText: 'Email',
                              icon: Icons.email_outlined,
                              validator: (value) {
                                return emailValidation(value);
                              },
                              obscureText: false,
                            ),
                            Gap(14.h),

                            /// Pssword Field
                            AuthTextFormField(
                              controller:
                                  context.read<LoginCubit>().passwordController,
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

                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {},
                                child: const Text(
                                  "Forgot Password?",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),

                  Gap(18.h),

                  /// Login Button''''''
                  BlocBuilder<LoginCubit, LoginState>(
                    builder: (context, state) {
                      return state is LoginLoading
                          ? Center(
                            child: SpinKitFadingCircle(
                              color: Colors.teal,
                              size: 50.0,
                            ),
                          )
                          : SizedBox(
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
                                context.read<LoginCubit>().login(context);
                              },
                              child: Text(
                                "Login",
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                    },
                  ),

                  Gap(14),

                  /// Sign Up Link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don’t have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.signUpScreen);
                        },
                        child: const Text(
                          "Sign Up",
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
