import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message; 
  Failure(this.message, [List properties = const <dynamic>[]]) : super();
}

// General failures
class ServerFailure extends Failure {
  ServerFailure(String message) : super(message);

  @override
  List<Object?> get props => [];
}
