import 'dart:convert';

class CreateRequestDTO {
  CreateRequestDTO({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    required this.password,
    required this.confirmPassword,
  });

  factory CreateRequestDTO.fromJson(String source) => CreateRequestDTO.fromMap(json.decode(source));

  factory CreateRequestDTO.fromMap(Map<String, dynamic> map) {
    return CreateRequestDTO(
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      role: map['role'],
      email: map['email'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
    );
  }

  final String title;
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String password;
  final String confirmPassword;

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
