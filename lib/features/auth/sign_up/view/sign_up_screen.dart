import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:hungry/core/routes/routes.dart';
import 'package:hungry/core/utils/validators.dart';
import 'package:hungry/features/auth/components/auth_button.dart';
import 'package:hungry/features/auth/components/text_form_field.dart';
import 'package:hungry/features/auth/components/top_bar.dart';
import 'package:hungry/features/auth/sign_up/cubit/sign_up_cubit.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _obscurePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Burger Background Image
          Image.asset(
            "assets/burger/burger12.jpeg", // ضع صورة الساندويتش هنا
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

                  BlocBuilder<SignUpCubit, SignUpState>(
                    builder: (context, state) {
                      return Form(
                        key: context.read<SignUpCubit>().formKey,
                        child: Column(
                          children: [
                            // Name Field
                            AuthTextFormField(
                              controller:
                                  context.read<SignUpCubit>().nameController,
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
                              controller:
                                  context.read<SignUpCubit>().emailController,
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
                              controller:
                                  context
                                      .read<SignUpCubit>()
                                      .phoneNumberController,
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
                              controller:
                                  context
                                      .read<SignUpCubit>()
                                      .passwordController,
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
                            Gap(30.h),
                            state is SignUpLoading
                                ? Center(
                                  child: SpinKitFadingCircle(
                                    color: Colors.teal,
                                    size: 50.0,
                                  ),
                                )
                                : AuthButton(
                                  onPressed: () {
                                    context.read<SignUpCubit>().signUp(context);
                                  },
                                  text: 'Sign Up',
                                ),
                          ],
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
                        "have an account? ",
                        style: TextStyle(color: Colors.white),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
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
