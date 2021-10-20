import '../core/use_case.dart';
import '../i_repositories/i_auth_repository.dart';

class LoginWithCredentialsUseCase implements UseCase<void, AuthLoginWithCredentialsUseCaseParams> {
  LoginWithCredentialsUseCase(this._authRepository);

  final IAuthRepository _authRepository;

  @override
  Future<void> call(AuthLoginWithCredentialsUseCaseParams params) async {
    try {
      await _authRepository.authenticate(email: params.email, password: params.password);
    } catch (e) {
      rethrow;
    }

    // ApiKey? apiKey = await _preferencesRepository.read<ApiKey>(fromJsonCallback: ApiKey.fromJsonCallback);
    // if (apiKey == null) {
    //   return false;
    // }

    // Session? session = await _preferencesRepository.read<Session>(fromJsonCallback: Session.fromJsonCallback);
    // if (session == null) {
    //   return false;
    // }
    // if (DateTime.now().millisecondsSinceEpoch < session.expires.millisecondsSinceEpoch) {
    //   return false;
    // }

    // Credentials? credentials =
    //     await _preferencesRepository.read<Credentials>(fromJsonCallback: Credentials.fromJsonCallback);
    // if (credentials == null) {
    //   return false;
    // }
  }
}

class AuthLoginWithCredentialsUseCaseParams {
  AuthLoginWithCredentialsUseCaseParams(this.email, this.password);

  final String email;
  final String password;
}
