import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthProviderService {
  FirebaseAuth _auth = FirebaseAuth.instance;
  AuthProviderService._();

  static AuthProviderService instance = AuthProviderService._();

  Future<void> signIn() async {
    GoogleSignInAccount signInAccount = await GoogleSignIn().signIn();
    GoogleSignInAuthentication authentication =
        await signInAccount.authentication;
    AuthCredential authCredential = GoogleAuthProvider.credential(
      idToken: authentication.idToken,
      accessToken: authentication.accessToken,
    );
    await _auth.signInWithCredential(authCredential);
  }
}
