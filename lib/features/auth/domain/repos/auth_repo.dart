import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/services/error.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<AppError, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String name,
  });

  Future<Either<AppError, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<AppError, UserEntity>> loginWithGoogle();
  Future<Either<AppError, UserEntity>> loginWithFacebook();
  Future<void> addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String userId});
}
