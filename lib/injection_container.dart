import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_bills_manager/core/network/network_info.dart';
import 'package:shared_bills_manager/features/Authentication/data/datasource/sign_up_remote_datasource.dart';
import 'package:shared_bills_manager/features/Authentication/data/repositories/sign_up_repo_impl.dart';
import 'package:shared_bills_manager/features/Authentication/domain/repositories/sign_up_repo.dart';
import 'package:shared_bills_manager/features/Authentication/domain/usecases/sign_up_with_email_and_pasword.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_bloc.dart';

final sl = GetIt.instance;

void init() {
  // Features - SignUp

  // Bloc
  sl.registerFactory(() => SignUpBloc(signUpUseCase: sl()));

  // Usecase
  sl.registerLazySingleton(() => SignUpUseCase(signUpRepo: sl()));

  // Repository
  sl.registerLazySingleton<SignUpRepo>(
    () => SignUpRepoImpl(
      networkInfo: sl(),
      signupRemoteDataSource: sl(),
    ),
  );

  // Datasources
  sl.registerLazySingleton<SignUpRemoteDataSource>(() => SignUpRemoteDataSourceImpl(auth: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
