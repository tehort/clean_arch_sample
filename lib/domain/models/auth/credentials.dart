import 'dart:convert';

class Credentials {
  Credentials({
    required this.email,
    required this.password,
  });

  factory Credentials.fromMap(Map<String, dynamic> map) {
    return Credentials(
      email: map['email'],
      password: map['password'],
    );
  }

  factory Credentials.fromJson(String source) => Credentials.fromMap(json.decode(source));

  final String email;
  final String password;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
      'password': password,
    };
  }

  String toJson() => json.encode(toMap());
}
