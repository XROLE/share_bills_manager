import 'package:shared_bills_manager/features/Authentication/data/models/user_model.dart';

abstract class SignUpRemoteDataSource {
  /// Call Firebase signInWithEmailAndPassword method
  /// 
  /// Throw a [SeverExeption] for all error codes.
  Future<UserModel>? signUpWithEmailAndPassword({required String email, required String password});
}
