import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hungry/core/network/api_error.dart';
import 'package:hungry/features/auth/data/auth_repo.dart';
import 'package:hungry/route.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  AuthRepo authRepo = AuthRepo();

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
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
            style: TextStyle(fontSize: 14.sp, color: Colors.white,fontWeight: FontWeight.bold),
          ),
          backgroundColor: backgroundColor,
          duration: duration,
        ),
      );
  }

  Future<void> login(context) async {
    if (formKey.currentState!.validate()) {
      emit(LoginLoading());
      try {
      final user = await authRepo.login(
          nameController.text.trim(),

          emailController.text.trim(),
          passwordController.text.trim(),
        );

        if (user != null) {
          emit(LoginSuccess());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (c) => AppRoute()),
          );
        }
      } catch (e) {
        emit(LoginFailure());
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
