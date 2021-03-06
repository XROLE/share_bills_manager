import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_bills_manager/core/error/exceptions.dart';
import 'package:shared_bills_manager/features/Authentication/data/models/user_model.dart';

abstract class SignUpRemoteDataSource {
  /// Call Firebase signInWithEmailAndPassword method
  ///
  /// Throw a [SeverExeption] for all error codes.
  Future<UserModel>? signUpWithEmailAndPassword({required String email, required String password});
  Future<UserModel>? signInWithEmailAndPassword({required String email, required String password});
}

class SignUpRemoteDataSourceImpl implements SignUpRemoteDataSource {
  final FirebaseAuth auth;

  SignUpRemoteDataSourceImpl({required this.auth});

  @override
  Future<UserModel>? signUpWithEmailAndPassword(
      {required String email, required String password}) async {
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
      return UserModel.fromJson(userMap);
    } on FirebaseAuthException catch(e) {

      print('THere was firebase auth exception  =========================================> $e');
      throw ServerException(e.message ?? '');
    } 
    catch (e) {
      print('Error from the datasource =========================================> $e');
      throw ServerException(e.toString());
    }
  }

  @override
  Future<UserModel>? signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserCredential result =
          await auth.signInWithEmailAndPassword(email: email, password: password);
      User? user = result.user;

      Map<String, dynamic> userMap = {
        'uid': user?.uid ?? '',
        'email': user?.email ?? '',
        'displayName': user?.displayName ?? '',
        'emaemailVerifiedil': user?.emailVerified,
      };
      print('User signed in successfully=================> $user');
      return UserModel.fromJson(userMap);
    } on FirebaseAuthException catch (e){

      print('There was firebase auth exception ===== $e');
      throw ServerException(e.message ?? '');
    }
    catch (e) {
      print('An error occured while signing in ===== $e');
      throw ServerException(e.toString());
    }
  }
}
