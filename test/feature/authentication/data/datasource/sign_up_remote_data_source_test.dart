import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_bills_manager/features/Authentication/data/datasource/sign_up_remote_datasource.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

void main() {
  SignUpRemoteDataSourceImpl signUpRemoteDataSourceImpl;
  MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    signUpRemoteDataSourceImpl = SignUpRemoteDataSourceImpl(auth: mockFirebaseAuth);
  });

  group('Sign up with email and password', () {
    final String tEmail = 'abc@gmail.com';
    final String tPassword = 'abc123';
  });
}
