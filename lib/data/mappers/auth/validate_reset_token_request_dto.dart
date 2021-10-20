import 'dart:convert';

class ValidateResetTokenRequestDTO {
  ValidateResetTokenRequestDTO({required this.token});

  factory ValidateResetTokenRequestDTO.fromMap(Map<String, dynamic> map) {
    return ValidateResetTokenRequestDTO(
      token: map['token'],
    );
  }

  factory ValidateResetTokenRequestDTO.fromJson(String source) =>
      ValidateResetTokenRequestDTO.fromMap(json.decode(source));

  final String token;

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  String toJson() => json.encode(toMap());
}
