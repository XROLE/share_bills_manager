import 'package:dartz/dartz.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';
import 'package:shared_bills_manager/features/Authentication/domain/repositories/sign_up_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_bills_manager/features/Authentication/domain/usecases/sign_up_with_email_and_pasword.dart';

class MockSignUpRepo extends Mock implements SignUpRepo {}

void main() {
  late SignUpUseCase usecase;
  late MockSignUpRepo mockSignUpRepo;

  setUp(() {
    mockSignUpRepo = MockSignUpRepo();
    usecase = SignUpUseCase(signUpRepo: mockSignUpRepo);
  });

  final String tEmail = 'abc@gmail.com';
  final String tPassword = 'abc123';
  final UserEntity userEntity = UserEntity(
      uid: '5b296a7e-36eb-11ec-8d3d-0242ac130003',
      displayName: '',
      email: tEmail,
      emailVerified: false);
  test(('Should sign user up with Email and Password'), () async {
    when(mockSignUpRepo.signUpWithEmailAndPassword(email: tEmail, password: tPassword))
        .thenAnswer((_) async => Right(userEntity));

    final result = await usecase.signUpWithEmailAndPassword(email: tEmail, password: tPassword);
    expect(result, Right(userEntity));
    verify(mockSignUpRepo.signUpWithEmailAndPassword(email: tEmail, password: tPassword));
    verifyNoMoreInteractions(mockSignUpRepo);
  });
}
