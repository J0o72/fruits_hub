import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/networking/error.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<AppError, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String name,
  });
}
