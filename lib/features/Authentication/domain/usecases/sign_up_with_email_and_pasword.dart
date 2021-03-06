import 'package:dartz/dartz.dart';
import 'package:shared_bills_manager/core/error/failure.dart';
import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';
import 'package:shared_bills_manager/features/Authentication/domain/repositories/sign_up_repo.dart';

class SignUpUseCase {
  final SignUpRepo signUpRepo;

  SignUpUseCase({required this.signUpRepo});
  Future<Either<Failure, UserEntity?>?> signUpWithEmailAndPassword(
      {required String email, required String password}) async {
    return await signUpRepo.signUpWithEmailAndPassword(email: email, password: password);
  }

  Future<Either<Failure, UserEntity?>?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await signUpRepo.signInWithEmailAndPassword(email: email, password: password);
  }
}
