import 'package:fruit_hub/features/auth/domain/entities/user_entity.dart';

import '../../../../core/networking/result.dart';

abstract class AuthRepo {
  Future<Result<UserEntity>> createUserWithEmailAndPassword({
    required String email,
    required String password,
    String? name,
  });
}
