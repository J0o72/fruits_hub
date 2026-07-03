import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/logic/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required this.authRepo}) : super(LoginInitial());

  final AuthRepo authRepo;

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
}
