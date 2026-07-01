import 'package:fruit_hub/core/networking/firebase_auth_service.dart';
import 'package:fruit_hub/features/auth/data/repos/auth_repo_implementation.dart';
import 'package:fruit_hub/features/auth/domain/repos/auth_repo.dart';
import 'package:fruit_hub/features/auth/logic/register/register_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

Future<void> setUpGetIt() async {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  // Register
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImplementation(
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
  getIt.registerFactory<RegisterCubit>(
    () => RegisterCubit(authRepo: getIt<AuthRepo>()),
  );
}
