import 'dart:convert';

import '../../../domain/models/auth/sign_up_user_data.dart';

class RegisterRequestDTO {
  RegisterRequestDTO({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.acceptTerms,
  });

  factory RegisterRequestDTO.fromMap(Map<String, dynamic> map) {
    return RegisterRequestDTO(
      title: map['title'],
      firstName: map['firstName'],
      lastName: map['lastName'],
      email: map['email'],
      password: map['password'],
      confirmPassword: map['confirmPassword'],
      acceptTerms: map['acceptTerms'],
    );
  }

  factory RegisterRequestDTO.fromJson(String source) => RegisterRequestDTO.fromMap(json.decode(source));

  factory RegisterRequestDTO.fromUserData(SignUpUserData signUpUserData) {
    return RegisterRequestDTO(
      title: signUpUserData.title,
      firstName: signUpUserData.firstName,
      lastName: signUpUserData.lastName,
      email: signUpUserData.email,
      password: signUpUserData.password,
      confirmPassword: signUpUserData.confirmPassword,
      acceptTerms: signUpUserData.acceptTerms,
    );
  }

  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final bool acceptTerms;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'password': password,
      'confirmPassword': confirmPassword,
      'acceptTerms': acceptTerms,
    };
  }

  String toJson() => json.encode(toMap());
}
