import 'package:fruit_hub/core/networking/firebase_auth_service.dart';
import 'package:fruit_hub/core/networking/firebase_error_handler.dart';
import 'package:fruit_hub/core/networking/result.dart';
import 'package:fruit_hub/features/auth/data/models/user_model.dart';
import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImplementation implements AuthRepo {
  final FirebaseAuthService firebaseAuthService;

  AuthRepoImplementation({required this.firebaseAuthService});

  @override
  Future<Result<UserEntity>> createUserWithEmailAndPassword(
    String email,
    String password,
    String name,
  ) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return Result.success(UserModel.fromFirebaseUser(user));
    } catch (e) {
      return Result.failure(FirebaseErrorHandler.handleError(e));
    }
  }
}
