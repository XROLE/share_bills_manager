import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_bills_manager/core/error/platform/network_info.dart';
import 'package:shared_bills_manager/features/Authentication/data/datasource/sign_up_remote_datasource.dart';
import 'package:shared_bills_manager/features/Authentication/data/models/user_model.dart';
import 'package:shared_bills_manager/features/Authentication/data/repositories/sign_up_repo_impl.dart';
import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';

class MockSignUpRemoteDataSource extends Mock implements SignUpRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  late SignUpRepoImpl signUpRepoImpl;
  late MockSignUpRemoteDataSource mockSignUpRemoteDataSource;
  late MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockSignUpRemoteDataSource = MockSignUpRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    signUpRepoImpl = SignUpRepoImpl(
      signupRemoteDataSource: mockSignUpRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  group("Sign up user", () {
    final String tEmail = "abc@gmail.com";
    final String tPassword = "abc123";
    final String tUid = "5b296a7e-36eb-11ec-8d3d-0242ac130003";
    final String tDisplayName = "Mr Test";
    final bool tEmailVerified = false;

    final UserModel tUserModel = UserModel(
        uid: tUid, displayName: tDisplayName, email: tEmail, emailVerified: tEmailVerified);
    final UserEntity tUserEntity = tUserModel;

    test("Check if the device is online", () {
      when(mockNetworkInfo.isConnected).thenAnswer((realInvocation) async => true);
      signUpRepoImpl.signUpWithEmailAndPassword(email: tEmail, password: tPassword);
      verify(mockNetworkInfo.isConnected);
    });
    group("Device is online", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((realInvocation) async => true);
      });

      test("Should sign up user when a call to signup remote datasource is successful", () async {
        when(mockSignUpRemoteDataSource.signUpWithEmailAndPassword(
                email: tEmail, password: tPassword))
            .thenAnswer((realInvocation) async => tUserModel);
            
      final result = await signUpRepoImpl.signUpWithEmailAndPassword(email: tEmail, password: tPassword);
      verify(mockSignUpRemoteDataSource.signUpWithEmailAndPassword(
          email: tEmail, password: tPassword));
      expect(result, Right(tUserEntity));
      });

    });

    group("Device is offline", () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((realInvocation) async => false);
      });
    });
  });
}
