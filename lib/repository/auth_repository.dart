
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fixia_app/models/auth_response.dart';

class AuthRepository {
  Future<AuthResponse> createUser(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      return AuthResponse(userCredential: credential);
    } on FirebaseAuthException catch (e) {
      String error = '';
      if (e.code == 'weak-password') {
        error = "The password provided is too weak.";
      } else if (e.code == 'email-already-in-use') {
        error = "The account already exists for that email.";
      }
      return AuthResponse(error: error);
    } catch (e) {
      return AuthResponse(error: "$e");
    }
  }

  Future<AuthResponse> loginUser(
      String logemailAddress, String logpassword) async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: logemailAddress, password: logpassword);
      return AuthResponse(userCredential: credential);
    } on FirebaseAuthException catch (e) {
      String error = '';
      if (e.code == 'user-not-found') {
        error = "user not found";
      } else if (e.code == 'wrong-password') {
        error = 'wrong password';
      }
      return AuthResponse(error: error);
    }
  }

  Future signOut()async{
  await FirebaseAuth.instance.signOut();
  }


// Future<UserCredential> signInWithGoogle() async {
//   // Trigger the authentication flow
//   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

//   // Obtain the auth details from the request
//   final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

//   // Create a new credential
//   final credential = GoogleAuthProvider.credential(
//     accessToken: googleAuth?.accessToken,
//     idToken: googleAuth?.idToken,
//   );

//   // Once signed in, return the UserCredential
//   return await FirebaseAuth.instance.signInWithCredential(credential);
// }
}
