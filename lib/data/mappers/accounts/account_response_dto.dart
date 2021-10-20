import 'dart:convert';

class AccountResponseDTO {
  AccountResponseDTO({
    required this.id,
    required this.created,
    required this.isVerified,
    this.title,
    this.firstName,
    this.lastName,
    this.email,
    this.role,
    this.updated,
  });

  factory AccountResponseDTO.fromMap(Map<String, dynamic> map) {
    return AccountResponseDTO(
      id: map['id'],
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      role: map['role'],
      created: DateTime.fromMillisecondsSinceEpoch(map['created']),
      updated: DateTime.fromMillisecondsSinceEpoch(map['updated']),
      isVerified: map['isVerified'],
    );
  }

  factory AccountResponseDTO.fromJson(String source) => AccountResponseDTO.fromMap(json.decode(source));

  final int id;
  final String? title;
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? role;
  final DateTime created;
  final DateTime? updated;
  final bool isVerified;

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
    };
  }

  String toJson() => json.encode(toMap());
}
