import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:infinity/models/user_model.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> saveUserDetails(UserModel user) async {
    await _firestore.collection('users').doc(user.uid).set(user.toMap());
  }
}
