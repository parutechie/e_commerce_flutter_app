import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:infinity/models/user_model.dart';
import 'package:infinity/services/firebase_auth_service.dart';
import 'package:infinity/services/firestore_service.dart';

class AuthController {
  final FirebaseAuthService _authService = FirebaseAuthService();
  final FirestoreService _firestoreService = FirestoreService();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> signUp(String email, String password, String name) async {
    try {
      User? user = await _authService.signUpWithEmail(email, password);
      if (user != null) {
        UserModel userModel =
            UserModel(uid: user.uid, email: user.email!, name: name);
        await _firestoreService.saveUserDetails(userModel);
        await _firestore.collection('users').doc(user.uid).set({
          'name': name,
          'email': email,
          'uid': user.uid,
          'timestamp': DateTime.now(),
        });
      }
      return user;
    } catch (e) {
      rethrow;
    }
  }

  Future<User?> signIn(String email, String password) async {
    try {
      return await _authService.signInWithEmail(email, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<void> signOut() async {
    await _authService.signOut();
  }
}
