import 'user_profile.dart';

class UserAccount {
  UserAccount({
    required this.created,
    required this.email,
    required this.id,
    required this.profile,
    required this.updated,
    required this.username,
    required this.verified,
    required this.verificationDate,
  });

  factory UserAccount.fromJson(Map<String, dynamic> json) {
    return UserAccount(
      created: json['created'],
      id: json['id'],
      updated: json['updated'],
      username: json['username'],
      verificationDate: json['verificationDate'],
      email: json['email'],
      profile: json['profile'],
      verified: json['verified'],
    );
  }

  final String id;
  final String username;
  final String email;
  final bool verified;
  final UserProfile? profile;
  final DateTime created;
  final DateTime? updated;
  final DateTime? verificationDate;
}
