import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/networking/error.dart';

class FirebaseErrorHandler {
  static AppError handleError(dynamic error) {
    if (error is FirebaseAuthException) {
      switch (error.code) {
        case 'invalid-email':
          return ServerError(message: 'البريد الإلكتروني غير صحيح');
        case 'email-already-in-use':
          return ServerError(message: 'هذا البريد مستخدم بالفعل');
        case 'network-request-failed':
          return ServerError(message: 'تاكد من اتصالك بالانترنت.');
        case 'wrong-password':
          return ServerError(message: 'كلمة المرور غير صحيحة');
        default:
          return ServerError(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          );
      }
    } else {
      return ServerError(message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.');
    }
  }
}
