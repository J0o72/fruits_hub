import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/services/database_service.dart';
import 'package:fruit_hub/core/services/error.dart';
import 'package:fruit_hub/core/services/firebase_auth_service.dart';
import 'package:fruit_hub/core/services/firebase_error_handler.dart';
import 'package:fruit_hub/core/services/firestore_collection_constants.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;
  final DataBaseService dataBaseService;

  AuthRepoImplementation({
    required this.firebaseAuthService,
    required this.dataBaseService,
  });

  @override
  Future<Either<AppError, UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  }) async {
    User? user;
    try {
      user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      log(
        'AuthRepoImpl  =>  name: ${name ?? "Empty"}, email: ${user.email ?? "Empty"}',
      );
      var userEntity = UserEntity(userId: user.uid, email: email, name: name!);
      addUserData(user: userEntity);
      return right(userEntity);
    } catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
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
      var userData = await getUserData(userId: user.uid);
      log(
        "UserData =>  ${userData.email} || ${userData.userId} || ${userData.name}",
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
    User? user;
    try {
      user = await firebaseAuthService.signInWithGoogle();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await dataBaseService.checkIfDataExists(
        path: FirestoreCollectionConstants.userCollection,
        docId: user.uid,
      );

      if (isUserExists) {
        await getUserData(userId: user.uid);
        log("UserData =>  ${user.email} || ${user.uid} || ${user.displayName}");
      } else {
        await addUserData(user: userEntity);
        log("add user data **********************");
      }
      return right(userEntity);
    } on Exception catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log(
        "Exception in AuthRepoImplementation.loginWithGoogle: ${FirebaseErrorHandler.handleError(e)}",
      );
      return left(FirebaseErrorHandler.handleError(e));
    }
  }

  @override
  Future<Either<AppError, UserEntity>> loginWithFacebook() async {
    User? user;
    try {
      user = await firebaseAuthService.signInWithFacebook();
      var userEntity = UserModel.fromFirebaseUser(user);
      var isUserExists = await dataBaseService.checkIfDataExists(
        path: FirestoreCollectionConstants.userCollection,
        docId: user.uid,
      );

      if (isUserExists) {
        await getUserData(userId: user.uid);
      } else {
        await addUserData(user: userEntity);
      }
      return right(userEntity);
    } on Exception catch (e) {
      if (user != null) {
        await firebaseAuthService.deleteUser();
      }
      log(
        "Exception in AuthRepoImplementation.loginWithGoogle***: ${FirebaseErrorHandler.handleError(e)}",
      );
      return left(FirebaseErrorHandler.handleError(e));
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await dataBaseService.addData(
      path: FirestoreCollectionConstants.userCollection,
      docId: user.userId,
      data: user.toMap(),
    );
  }

  @override
  Future<UserEntity> getUserData({required String userId}) async {
    var userData = await dataBaseService.getData(
      path: FirestoreCollectionConstants.userCollection,
      docId: userId,
    );

    return UserModel.fromJson(userData);
  }
}
