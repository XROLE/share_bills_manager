import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String uid;
  final String displayName;
  final String email;
  final bool? emailVerified;

  UserEntity({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.emailVerified,
  });

  @override
  List<Object?> get props => [uid, displayName, email, emailVerified];
}
