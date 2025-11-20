import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/route.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  AuthRepo authRepo = AuthRepo();

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  void showAppSnackBar(
    BuildContext context, {
    required String message,
    Color backgroundColor = Colors.red,
    Duration duration = const Duration(seconds: 3),
  }) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(16).r,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12).r,
          ),
          content: Text(
            message,
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          backgroundColor: backgroundColor,
          duration: duration,
        ),
      );
  }

  Future<void> signUp(context) async {
    if (formKey.currentState!.validate()) {
      try {
        emit(SignUpLoading());
        final user = await authRepo.signup(
          nameController.text.trim(),

          emailController.text.trim(),
          phoneNumberController.text.trim(),

          passwordController.text.trim(),
        );

        if (user != null) {
          emit(SignUpSuccess());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => AppRoute()),
          );
        }
      } catch (e) {
        emit(SignUpFailure());
        String errorMsg = 'unhandled error in login';

        if (e is ApiError) {
          errorMsg = e.message!;
        }
        print(errorMsg);
        showAppSnackBar(context, message: errorMsg);
      }
    }
  }
}
