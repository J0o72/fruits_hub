import 'package:firebase_auth/firebase_auth.dart';
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
}
