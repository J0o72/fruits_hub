import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/logic/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  final AuthRepo authRepo;

  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  Future<void> loginUsingEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(LoginLoading());

    final response = await authRepo.loginWithEmailAndPassword(
      email: email,
      password: password,
    );
    response.fold(
      (error) {
        emit(
          LoginFailure(
            message:
                error.message ?? 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          ),
        );
      },
      (userEntity) {
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> loginUsingGoogle() async {
    emit(GoogleLoginLoading());

    final response = await authRepo.loginWithGoogle();
    response.fold(
      (error) {
        if (error.message != 'تم إلغاء تسجيل الدخول بواسطة جوجل') {
          emit(
            LoginFailure(
              message:
                  error.message ?? 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
            ),
          );
        }
      },
      (userEntity) {
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> loginUsingFacebook() async {
    emit(FacebookLoginLoading());

    final response = await authRepo.loginWithFacebook();
    response.fold(
      (error) {
        // if (error.message != 'تم إلغاء تسجيل الدخول بواسطة جوجل') {
        emit(
          LoginFailure(
            message:
                error.message ?? 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          ),
        );
        // }
      },
      (userEntity) {
        emit(LoginSuccess(userEntity: userEntity));
      },
    );
  }
}
