import 'dart:convert';

class AuthenticateResponseDTO {
  AuthenticateResponseDTO({
    required this.id,
    required this.created,
    required this.isVerified,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.updated,
    this.jwtToken,
  });

  factory AuthenticateResponseDTO.fromMap(Map<String, dynamic> map) {
    return AuthenticateResponseDTO(
      id: map['id'],
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      role: map['role'],
      created: DateTime.fromMillisecondsSinceEpoch(map['created']),
      updated: DateTime.fromMillisecondsSinceEpoch(map['updated']),
      isVerified: map['isVerified'],
      jwtToken: map['jwtToken'],
    );
  }

  factory AuthenticateResponseDTO.fromJson(String source) => AuthenticateResponseDTO.fromMap(json.decode(source));

  final int id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? role;
  final DateTime created;
  final DateTime? updated;
  final bool isVerified;
  final String? jwtToken;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'role': role,
      'created': created.millisecondsSinceEpoch,
      'updated': updated?.millisecondsSinceEpoch,
      'isVerified': isVerified,
      'jwtToken': jwtToken,
    };
  }

  String toJson() => json.encode(toMap());
}
