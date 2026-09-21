import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_list/services/authentication_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;

  AuthenticationServices _authenticationServices = AuthenticationServices();

  AuthenticationProvider() {
    _user = _authenticationServices.currentUser;
  }

  Future<void> signUp(String email, String password, String userName) async {
    _user = await _authenticationServices.signUp(email, password, userName);
    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    _user = await _authenticationServices.signIn(email, password);
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authenticationServices.signOut();
    _user = null;
    notifyListeners();
  }
}
