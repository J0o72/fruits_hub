import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  FirebaseAuthService() {
    GoogleSignIn.instance.initialize(
      serverClientId:
          '168059263212-tsbu7q5qfei6v47pmrrrc7o8kldrkumh.apps.googleusercontent.com',
    );
  }

  Future<User> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user!;
  }

  Future<User> loginWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    final userCredential = await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user!;
  }

  Future<User> signInWithGoogle() async {
    final GoogleSignInAccount googleUser = await GoogleSignIn.instance
        .authenticate();

    final GoogleSignInAuthentication googleAuth = googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      idToken: googleAuth.idToken,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }

  Future<User> signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    if (result.status != LoginStatus.success) {
      throw Exception(result.message);
    }

    final credential = FacebookAuthProvider.credential(
      result.accessToken!.tokenString,
    );

    return (await FirebaseAuth.instance.signInWithCredential(credential)).user!;
  }
}
