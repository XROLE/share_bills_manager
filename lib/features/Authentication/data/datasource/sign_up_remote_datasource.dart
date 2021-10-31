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
    try {
      UserCredential result =
          await auth.signInWithEmailAndPassword(email: email, password: password);
      Map<String, dynamic> userMap = {
        'uid': result.user?.uid ?? '',
        'email': result.user?.email ?? '',
        'displayName': result.user?.displayName ?? '',
        'emaemailVerifiedil': result.user?.emailVerified ?? false,
      };
      return UserModel.fromJson(userMap);
    } catch (e) {
      throw ServerException();
    }
  }
}
