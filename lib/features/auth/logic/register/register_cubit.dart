import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/logic/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit({required this.authRepo}) : super(RegisterInitial());

  final AuthRepo authRepo;

  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<void> createAccountUsingEmailAndPassword({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoading());

    final response = await authRepo.createUserWithEmailAndPassword(
      email: email,
      password: password,
      name: name,
    );
    response.fold(
      (error) {
        emit(
          RegisterFailure(
            message:
                error.message ?? 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          ),
        );
      },
      (userEntity) {
        emit(RegisterSuccess(userEntity: userEntity));
      },
    );
  }
}
