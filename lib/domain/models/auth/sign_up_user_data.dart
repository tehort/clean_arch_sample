class SignUpUserData {
  SignUpUserData({
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.role,
    required this.acceptTerms,
  });

  final String title;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String confirmPassword;
  final String role;
  final bool acceptTerms;
}
