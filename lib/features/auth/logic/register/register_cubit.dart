import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit_hub/features/auth/logic/register/register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterState.initial());
}
