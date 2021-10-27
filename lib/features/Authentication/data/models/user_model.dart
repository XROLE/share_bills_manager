import 'package:shared_bills_manager/features/Authentication/domain/entities/user.dart';

class UserModel extends UserEntity {
  final String uid;
  final String displayName;
  final String email;
  final bool emailVerified;

  UserModel({
    required this.uid,
    required this.displayName,
    required this.email,
    required this.emailVerified,
  }) : super(uid: uid, displayName: displayName, email: email, emailVerified: emailVerified);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        uid: json['uid'],
        displayName: json['displayName'],
        email: json['email'],
        emailVerified: json['emailVerified']);
  }

  Map<String, dynamic> toJson() {
    return {
      "uid": uid,
      "displayName": displayName,
      "email": email,
      "emailVerified": emailVerified,

    };
  }
}
