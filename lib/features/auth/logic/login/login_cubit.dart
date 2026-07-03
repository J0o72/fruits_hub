import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/logic/login/login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
}
