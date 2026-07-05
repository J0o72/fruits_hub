import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:fruit_hub/core/networking/error.dart';
import 'package:fruit_hub/core/networking/firebase_auth_service.dart';
import 'package:fruit_hub/core/networking/firebase_error_handler.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplementation({required this.firebaseAuthService});

  @override
  Future<Either<AppError, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log(
        'AuthRepoImpl  =>  name: ${user.displayName ?? "Empty"}, email: ${user.email ?? "Empty"}',
      );
      return right(UserModel.fromFirebaseUser(user));
    } catch (e) {
      log(
        "Exception in AuthRepoImplementation.createUserWithEmailAndPassword: ${FirebaseErrorHandler.handleError(e)}",
      );
      return left(FirebaseErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.loginWithEmailAndPassword(
        email: email,
        password: password,
      );
      return right(UserModel.fromFirebaseUser(user));
    } on Exception catch (e) {
      log(
        "Exception in AuthRepoImplementation.signInWithEmailAndPassword: ${FirebaseErrorHandler.handleError(e)}",
      );
      return left(FirebaseErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> loginWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.fromFirebaseUser(user));
    } on Exception catch (e) {
      log(
        "Exception in AuthRepoImplementation.loginWithGoogle: ${FirebaseErrorHandler.handleError(e)}",
      );
      return left(FirebaseErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> loginWithFacebook() async {
    try {
      var user = await firebaseAuthService.signInWithFacebook();
      return right(UserModel.fromFirebaseUser(user));
    } on Exception catch (e) {
      log(
        "Exception in AuthRepoImplementation.loginWithGoogle***: ${FirebaseErrorHandler.handleError(e)}",
      );
      return left(FirebaseErrorHandler.handleError(e));
    }
  }
}
