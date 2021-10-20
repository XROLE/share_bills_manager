import 'package:firebase_auth/firebase_auth.dart';

class AuthenticateUser {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<UserCredential?> signInWithEmailAndPassword({String? email, String? password}) async {
    String _email = email ?? '';
    String _password = password ?? '';

    try {
      UserCredential userCredential =
          await auth.createUserWithEmailAndPassword(email: _email, password: _password);

      return userCredential;
    } catch (e) {
      print('Sorry, there was an error while signing in');
    }
  }
}
