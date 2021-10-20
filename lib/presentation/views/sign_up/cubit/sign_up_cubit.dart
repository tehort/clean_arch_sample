import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/core/app_exception.dart';
import '../../../../domain/models/auth/sign_up_user_data.dart';
import 'package:formz/formz.dart';

import '../../../../domain/use_cases/sign_up_user_use_case.dart';
import '../../../models/validators/confirm_password_validator.dart';
import '../../../models/validators/email_validator.dart';
import '../../../models/validators/password_validator.dart';
import '../../../models/validators/required_boolean_validator.dart';
import '../../../models/validators/required_input_validator.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required signUpUserUseCase})
      : _signUpUserUseCase = signUpUserUseCase,
        super(const SignUpState());

  final SignUpUserUseCase _signUpUserUseCase;

  void titleChanged(String value) {
    final title = RequiredInputValidator.dirty(value: value);
    emit(state.copyWith(title: title, status: _validateForm(title: title)));
  }

  void firstNameChanged(String value) {
    final firstName = RequiredInputValidator.dirty(value: value);
    emit(state.copyWith(firstName: firstName, status: _validateForm(firstName: firstName)));
  }

  void lastNameChanged(String value) {
    final lastName = RequiredInputValidator.dirty(value: value);
    emit(state.copyWith(lastName: lastName, status: _validateForm(lastName: lastName)));
  }

  void emailChanged(String value) {
    final email = EmailValidator.dirty(value: value);
    emit(state.copyWith(email: email, status: _validateForm(email: email)));
  }

  void passwordChanged(String value) {
    final password = PasswordValidator.dirty(value: value);
    emit(state.copyWith(password: password, status: _validateForm(password: password)));
  }

  String? passwordValidator(String? value) {
    passwordChanged(value ?? '');
  }

  void confirmPasswordChanged(String value) {
    final confirmPassword = ConfirmPasswordValidator.dirty(password: state.password.value, value: value);
    emit(state.copyWith(confirmPassword: confirmPassword, status: _validateForm(confirmPassword: confirmPassword)));
  }

  void acceptTermsChanged(bool value) {
    final acceptTerms = RequiredBooleanValidator.dirty(value: value);
    emit(state.copyWith(acceptTerms: acceptTerms, status: _validateForm(acceptTerms: acceptTerms)));
  }

  FormzStatus? _validateForm({
    RequiredInputValidator? title,
    RequiredInputValidator? firstName,
    RequiredInputValidator? lastName,
    RequiredBooleanValidator? acceptTerms,
    EmailValidator? email,
    RequiredInputValidator? role,
    PasswordValidator? password,
    ConfirmPasswordValidator? confirmPassword,
  }) {
    return Formz.validate([
      title ?? state.title,
      firstName ?? state.firstName,
      lastName ?? state.lastName,
      email ?? state.email,
      password ?? state.password,
      confirmPassword ?? state.confirmPassword,
      role ?? state.role,
      acceptTerms ?? state.acceptTerms,
    ]);
  }

  Future<void> signUp() async {
    try {
      if (state.status.isValidated) {
        emit(state.copyWith(status: FormzStatus.submissionInProgress));
        var params = SignUpUserUseCaseParams(
          SignUpUserData(
            title: state.title.value,
            firstName: state.firstName.value,
            lastName: state.lastName.value,
            email: state.email.value,
            password: state.password.value,
            confirmPassword: state.confirmPassword.value,
            role: state.role.value,
            acceptTerms: state.acceptTerms.value,
          ),
        );
        await _signUpUserUseCase(params);
        emit(state.copyWith(status: FormzStatus.submissionSuccess));
      } else {
        _setAllFieldsDirty();
      }
    } on AppException catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: e.message));
    }
  }

  void _setAllFieldsDirty() {
    firstNameChanged(state.firstName.value);
    lastNameChanged(state.lastName.value);
    emailChanged(state.email.value);
    titleChanged(state.title.value);
    passwordChanged(state.password.value);
    confirmPasswordChanged(state.confirmPassword.value);
  }
}
