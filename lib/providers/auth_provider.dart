import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infinity/controllers/auth_controller.dart';

class AuthProvider with ChangeNotifier {
  final AuthController _authController = AuthController();
  User? _user;

  User? get user => _user;

  Future<void> signUp(String email, String password, String name) async {
    _user = await _authController.signUp(email, password, name);

    notifyListeners();
  }

  Future<void> signIn(String email, String password) async {
    _user = await _authController.signIn(email, password);
    notifyListeners();
  }

  Future<void> signOut() async {
    await _authController.signOut();
    _user = null;
    notifyListeners();
  }
}
