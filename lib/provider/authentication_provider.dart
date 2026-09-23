import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:todo_list/services/authentication_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  User? _user;
  User? get user => _user;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  AuthenticationServices _authenticationServices = AuthenticationServices();

  AuthenticationProvider() {
    _user = _authenticationServices.currentUser;
  }

  Future<bool> signUp(String email, String password, String userName) async {
    try {
      _isLoaded = true;
      notifyListeners();
      _user = await _authenticationServices.signUp(email, password, userName);

      _isLoaded = false;
      notifyListeners();
    } catch (e) {
      _isLoaded = false;
      notifyListeners();
      return false;
    }
    return true;
  }

  Future<bool> signIn(String email, String password) async {
    try {
      _isLoaded = true;
      notifyListeners();
      _user = await _authenticationServices.signIn(email, password);
      notifyListeners();
      return true;
    } catch (e) {
      _isLoaded = false;
      notifyListeners();
      return false;
    }
  }

  Future<void> signOut() async {
    await _authenticationServices.signOut();
    _user = null;
    notifyListeners();
  }
}
