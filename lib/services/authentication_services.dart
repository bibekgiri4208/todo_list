import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password, String userName) async {
    final UserCredential = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    await UserCredential.user?.updateDisplayName(userName);
    await UserCredential.user?.reload();
    return UserCredential.user;
  }

  Future<User?> signIn(String email, String password) async {
    final UserCredential = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserCredential.user;
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  User? get currentUser => _auth.currentUser;
}
