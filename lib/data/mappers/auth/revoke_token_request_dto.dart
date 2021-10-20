import 'dart:convert';

class RevokeTokenRequestDTO {
  RevokeTokenRequestDTO({required this.token});

  factory RevokeTokenRequestDTO.fromMap(Map<String, dynamic> map) {
    return RevokeTokenRequestDTO(
      token: map['token'],
    );
  }

  factory RevokeTokenRequestDTO.fromJson(String source) => RevokeTokenRequestDTO.fromMap(json.decode(source));

  final String? token;

  Map<String, dynamic> toMap() {
    return {
      'token': token,
    };
  }

  String toJson() => json.encode(toMap());
}
