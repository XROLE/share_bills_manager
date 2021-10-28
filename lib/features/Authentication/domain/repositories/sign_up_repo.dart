import 'package:dartz/dartz.dart';
import 'package:shared_bills_manager/core/error/failure.dart';
import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';

abstract class SignUpRepo {
  Future<Either<Failure, UserEntity>>? signUpWithEmailAndPassword({required String email, required String password});
}
