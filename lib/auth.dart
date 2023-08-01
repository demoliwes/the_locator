import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth _authenticationInstance = FirebaseAuth.instance;
  Future<void> emailAndPasswordRegistration(
      String email, String password) async {
    try {
      await _authenticationInstance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('deu bom');
    } catch (e) {
      print(e);
    }
  }

  Future<void> emailAndPasswordSignIn(String email, String password) async {
    try {
      final user = await _authenticationInstance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print('deu bom');
    } catch (e) {
      print(e);
    }
  }
}
