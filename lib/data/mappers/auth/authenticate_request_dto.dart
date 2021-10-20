import 'dart:convert';

class AuthenticateRequestDTO {
  AuthenticateRequestDTO({
    required this.email,
    required this.password,
  });

  factory AuthenticateRequestDTO.fromMap(Map<String, dynamic> map) {
    return AuthenticateRequestDTO(
      email: map['email'],
      password: map['password'],
    );
  }
  factory AuthenticateRequestDTO.fromJson(String source) => AuthenticateRequestDTO.fromMap(json.decode(source));

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
