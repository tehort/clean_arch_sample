part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  const SignUpState({
    this.email = const EmailValidator.pure(),
    this.password = const PasswordValidator.pure(),
    this.status = FormzStatus.pure,
    this.errorMessage,
    this.title = const RequiredInputValidator.pure(),
    this.firstName = const RequiredInputValidator.pure(),
    this.lastName = const RequiredInputValidator.pure(),
    this.confirmPassword = const ConfirmPasswordValidator.pure(),
    this.role = const RequiredInputValidator.pure(),
    this.acceptTerms = const RequiredBooleanValidator.pure(),
  });

  final RequiredInputValidator title;
  final RequiredInputValidator firstName;
  final RequiredInputValidator lastName;
  final EmailValidator email;
  final PasswordValidator password;
  final ConfirmPasswordValidator confirmPassword;
  final RequiredInputValidator role;
  final String? errorMessage;
  final FormzStatus status;
  final RequiredBooleanValidator acceptTerms;

  SignUpState copyWith({
    RequiredInputValidator? title,
    RequiredInputValidator? firstName,
    RequiredInputValidator? lastName,
    EmailValidator? email,
    PasswordValidator? password,
    ConfirmPasswordValidator? confirmPassword,
    RequiredInputValidator? role,
    String? errorMessage,
    FormzStatus? status,
    RequiredBooleanValidator? acceptTerms,
  }) {
    return SignUpState(
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      role: role ?? this.role,
      errorMessage: errorMessage,
      status: status ?? this.status,
      acceptTerms: acceptTerms ?? this.acceptTerms,
    );
  }

  @override
  List<Object?> get props {
    return [
      title,
      firstName,
      lastName,
      email,
      password,
      confirmPassword,
      role,
      errorMessage,
      status,
      acceptTerms,
    ];
  }
}
