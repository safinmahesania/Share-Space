import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  Future<String> signUpWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'Email already exists.';
      } else if (e.code == 'invalid-email') {
        return 'Email address is not valid.';
      } else if (e.code == 'weak-password') {
        return 'The password provided is weak.';
      } else if (e.code == 'operation-not-allowed') {
        return 'Try again later.';
      } else {
        return 'Error occurred, try again.';
      }
    } catch (e) {
      return 'Error occurred, try again.';
    }
  }

  Future<String> signInWithEmailPassword(String email, String password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return 'success';
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        return 'The password provided is incorrect.';
      } else if (e.code == 'invalid-email') {
        return 'Email address is not valid.';
      } else if (e.code == 'user-disabled') {
        return 'This account is disabled.';
      } else if (e.code == 'user-not-found') {
        return 'Email address not found.';
      } else {
        return 'Error occurred, try again.';
      }
    } catch (e) {
      return 'Error occurred, try again.';
    }
  }

  signInWithGoogle() async {
    //Begin interactive sign in process
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    //Obtain auth details from request
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    //Create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    //finally, Lets sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

/*Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login(
    permissions: ['email', 'public_profile'],
  );

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential =
      FacebookAuthProvider.credential(loginResult.accessToken!.token);

  final userData = await FacebookAuth.instance.getUserData();

  String userEmail = userData['email'];
  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}*/
