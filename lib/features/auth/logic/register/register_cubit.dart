import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/core/networking/error.dart';
import 'package:fruit_hub/core/networking/result.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/logic/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepo}) : super(RegisterState.initial());

  final AuthRepo authRepo;

  Future<void> createAccountUsingEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterState.registerLoading());

    final response = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );

    response.when(
      success: (userEntity) {
        emit(RegisterState.registerSuccess(userEntity));
      },
      failure: (error) {
        emit(
          RegisterState.registerFailure(ServerError(message: error.message)),
        );
      },
    );
  }
}
