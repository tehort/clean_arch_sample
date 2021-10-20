import '../models/auth/sign_up_user_data.dart';

import '../core/use_case.dart';
import '../i_repositories/i_auth_repository.dart';

class SignUpUserUseCase implements UseCase<void, SignUpUserUseCaseParams> {
  SignUpUserUseCase(this._authRepository);

  final IAuthRepository _authRepository;

  @override
  Future<void> call(SignUpUserUseCaseParams params) async {
    try {
      await _authRepository.signUpUser(signUpUserData: params.signUpUserData);
    } catch (e) {
      rethrow;
    }
  }
}

class SignUpUserUseCaseParams {
  SignUpUserUseCaseParams(this.signUpUserData);

  final SignUpUserData signUpUserData;
}
