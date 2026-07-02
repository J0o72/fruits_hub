import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {
  final UserEntity userEntity;

  RegisterSuccess({required this.userEntity});
}

final class RegisterFailure extends RegisterState {
  final String message;
  RegisterFailure({required this.message});
}
