import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

@immutable
abstract class SignUpEvent extends Equatable {
  SignUpEvent([List props = const <dynamic>[]]) : super();
}

class SignUpWithEmailAndPassword extends SignUpEvent {
  final String email;
  final String password;

  SignUpWithEmailAndPassword(this.email, this.password);

  @override
  List<Object?> get props => [email, password];

}
