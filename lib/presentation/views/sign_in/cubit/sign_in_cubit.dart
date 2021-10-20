import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../../../domain/core/app_exception.dart';
import 'package:formz/formz.dart';

import '../../../../domain/use_cases/login_with_credentials_use_case.dart';
import '../../../models/validators/email_validator.dart';
import '../../../models/validators/password_validator.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({
    required loginWithCredentialsUseCase,
  })  : _loginWithCredentialsUseCase = loginWithCredentialsUseCase,
        super(const SignInState());

  final LoginWithCredentialsUseCase _loginWithCredentialsUseCase;

  void emailChanged(String value) {
    final email = EmailValidator.dirty(value: value);
    emit(state.copyWith(email: email, status: Formz.validate([email, state.password])));
  }

  void passwordChanged(String value) {
    final password = PasswordValidator.dirty(value: value);
    emit(state.copyWith(password: password, status: Formz.validate([state.email, password])));
  }

  Future<void> logInWithCredentials() async {
    if (!state.status.isValidated) {
      return;
    }

    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    try {
      var params = AuthLoginWithCredentialsUseCaseParams(state.email.value, state.password.value);
      await _loginWithCredentialsUseCase(params);
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    } on AppException catch (e) {
      emit(state.copyWith(status: FormzStatus.submissionFailure, errorMessage: e.message));
    }
  }
}
