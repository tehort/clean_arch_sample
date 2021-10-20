import 'dart:convert';

class ForgotPasswordRequestDTO {
  ForgotPasswordRequestDTO({
    required this.email,
  });

  factory ForgotPasswordRequestDTO.fromMap(Map<String, dynamic> map) {
    return ForgotPasswordRequestDTO(
      email: map['email'],
    );
  }

  factory ForgotPasswordRequestDTO.fromJson(String source) => ForgotPasswordRequestDTO.fromMap(json.decode(source));

  final String email;

  Map<String, dynamic> toMap() {
    return {
      'email': email,
    };
  }

  String toJson() => json.encode(toMap());
}
