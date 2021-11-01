import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_bills_manager/core/error/exceptions.dart';
import 'package:shared_bills_manager/features/Authentication/data/models/user_model.dart';

abstract class SignUpRemoteDataSource {
  /// Call Firebase signInWithEmailAndPassword method
  ///
  /// Throw a [SeverExeption] for all error codes.
  Future<UserModel>? signUpWithEmailAndPassword({required String email, required String password});
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final FirebaseAuth auth;

  SignUpRemoteDataSourceImpl({required this.auth});

  @override
  Future<UserModel>? signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    print('Email: $email');
    print('Pssword: $password');
    try {
      UserCredential result =
          await auth.createUserWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      Map<String, dynamic> userMap = {
        'uid': user?.uid ?? '',
        'email': user?.email ?? '',
        'displayName': user?.displayName ?? '',
        'emaemailVerifiedil': user?.emailVerified,
      };
      print('user account created successfuly ======================== $user');
      print('userMap======================== $userMap');
      return UserModel.fromJson(userMap);
    } catch (e) {
      print('Error from the datasource =========================================> $e');
      throw ServerException();
    }
  }
}
