import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';

@immutable
abstract class SignUpState extends Equatable {
  SignUpState([List props = const <dynamic>[]]) : super();
}

class Empty extends SignUpState {
  @override
  List<Object?> get props => [];
}

class Loading extends SignUpState {
  @override
  List<Object?> get props => [];
}

class Loaded extends SignUpState {
  final UserEntity? userEntity;

  Loaded({required this.userEntity});

  @override
  List<Object?> get props => [userEntity];
}

class Error extends SignUpState {
  final String message;

  Error({required this.message});

  @override
  List<Object?> get props => [message];
}
