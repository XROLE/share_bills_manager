import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';
import 'package:shared_bills_manager/features/Authentication/domain/usecases/sign_up_with_email_and_pasword.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_event.dart';
import 'package:shared_bills_manager/features/Authentication/presentation/bloc/sign_up_states.dart';

const String SERVER_FAILURE_MESSAGE = 'There was an error creating user account';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUpUseCase signUpUseCase;

  SignUpBloc({required this.signUpUseCase}) : super(Empty());

  SignUpState get initialState => Empty();

  @override
  Stream<SignUpState> mapEventToState(SignUpEvent event) async* {
    if (event is SignUpWithEmailAndPassword) {
      yield Loading();
      final failureOrUserEntity = await signUpUseCase.signUpWithEmailAndPassword(
          email: event.email, password: event.password);
      if (failureOrUserEntity != null)
        yield failureOrUserEntity.fold((failure) => Error(message: SERVER_FAILURE_MESSAGE),
            (userEntity) => Loaded(userEntity: userEntity));
    } else if (event is SignInWithEmailAndPassword) {
      yield Loading();
      final failureOrUserEntity = await signUpUseCase.signInWithEmailAndPassword(
          email: event.email, password: event.password);
      if (failureOrUserEntity != null)
        yield failureOrUserEntity.fold((failure) => Error(message: SERVER_FAILURE_MESSAGE),
            (userEntity) => Loaded(userEntity: userEntity));
    }
  }
}
