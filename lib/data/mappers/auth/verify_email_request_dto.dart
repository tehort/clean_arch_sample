import 'dart:convert';

class VerifyEmailRequestDTO {
  VerifyEmailRequestDTO({required this.token});

  factory VerifyEmailRequestDTO.fromMap(Map<String, dynamic> map) {
    return VerifyEmailRequestDTO(
      token: map['token'],
    );
  }

  factory VerifyEmailRequestDTO.fromJson(String source) => VerifyEmailRequestDTO.fromMap(json.decode(source));

  final String token;

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  String toJson() => json.encode(toMap());
}
