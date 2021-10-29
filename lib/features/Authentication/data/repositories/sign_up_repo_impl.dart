import 'package:shared_bills_manager/core/error/platform/network_info.dart';
import 'package:shared_bills_manager/features/Authentication/data/datasource/sign_up_remote_datasource.dart';
import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';
import 'package:shared_bills_manager/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_bills_manager/features/Authentication/domain/repositories/sign_up_repo.dart';

class SignUpRepoImpl implements SignUpRepo {
  final SignUpRemoteDataSource signupRemoteDataSource;
  final NetworkInfo networkInfo;

  SignUpRepoImpl({required this.networkInfo, required this.signupRemoteDataSource});

  @override
  Future<Either<Failure, UserEntity?>>? signUpWithEmailAndPassword(
      {required String email,  required String password}) async {
    networkInfo.isConnected;
    return  Right(await signupRemoteDataSource.signUpWithEmailAndPassword(email: email, password: password));
  }
}
