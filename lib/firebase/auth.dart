import 'package:firebase_auth/firebase_auth.dart';

class auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentUser => _firebaseAuth.currentUser;
  Stream<User?> get authstatechanges => _firebaseAuth.authStateChanges();

  Future<void> signInwithEmailandpassword(
      {required String email, required String password}) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    print('loged in');
  }

  Future<void> createnwithEmailandpassword(
      {required String email, required String password}) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    print('signed in');
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
    print('signed out');
  }
}
