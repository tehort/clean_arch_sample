import 'dart:convert';

class ResetPasswordRequestDTO {
  ResetPasswordRequestDTO({
    required this.token,
    required this.password,
    required this.confirmPassword,
  });

  factory ResetPasswordRequestDTO.fromMap(Map<String, dynamic> map) {
    return ResetPasswordRequestDTO(
      token: map['token'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
    );
  }

  factory ResetPasswordRequestDTO.fromJson(String source) => ResetPasswordRequestDTO.fromMap(json.decode(source));

  final String token;
  final String password;
  final String confirmPassword;

  Map<String, dynamic> toMap() {
    return {
      'token': token,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  String toJson() => json.encode(toMap());
}
