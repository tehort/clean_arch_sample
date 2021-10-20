import 'dart:convert';

class UpdateRequestDTO {
  UpdateRequestDTO({
    this.title,
    this.firstName,
    this.lastName,
    this.role,
    this.email,
    this.password,
    this.confirmPassword,
  });

  factory UpdateRequestDTO.fromJson(String source) => UpdateRequestDTO.fromMap(json.decode(source));

  factory UpdateRequestDTO.fromMap(Map<String, dynamic> map) {
    return UpdateRequestDTO(
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      role: map['role'],
      email: map['email'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
    );
  }

  final String? title;
  final String? firstName;
  final String? lastName;
  final String? role;
  final String? email;
  final String? password;
  final String? confirmPassword;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
    };
  }

  String toJson() => json.encode(toMap());
}
