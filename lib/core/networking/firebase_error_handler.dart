import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruit_hub/core/networking/error.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseErrorHandler {
  static AppError handleError(dynamic error) {
    if (error is FirebaseAuthException) {
      log("Exception in FirebaseErrorHandler: ${error.code}");

      switch (error.code) {
        case 'network-request-failed':
          return ServerError(message: 'تاكد من اتصالك بالانترنت.');
        case 'invalid-email':
          return ServerError(message: 'البريد الإلكتروني غير صحيح');
        case 'email-already-in-use':
          return ServerError(message: 'هذا البريد مستخدم بالفعل');

        case 'user-not-found':
          return ServerError(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.',
          );
        case 'wrong-password':
          return ServerError(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.',
          );

        case 'invalid-credential':
          return ServerError(
            message: 'الرقم السري او البريد الالكتروني غير صحيح.',
          );

        default:
          return ServerError(
            message: 'لقد حدث خطأ ما. الرجاء المحاولة مرة اخرى.',
          );
      }
    } else if (error is GoogleSignInException) {
      switch (error.code) {
        case GoogleSignInExceptionCode.canceled:
          return ServerError(message: 'تم إلغاء تسجيل الدخول بواسطة جوجل');
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
