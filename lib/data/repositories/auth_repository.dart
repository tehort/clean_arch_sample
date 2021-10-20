import '../../domain/i_repositories/i_auth_repository.dart';
import '../data_sources/auth_data_source.dart';
import '../mappers/auth/authenticate_request_dto.dart';
import '../mappers/auth/register_request_dto.dart';

class AuthRepository extends IAuthRepository {
  AuthRepository(this._authDataSource);

  final IAuthDataSource _authDataSource;

  @override
  Future<void> authenticate({required String email, required String password}) async {
    try {
      await _authDataSource.authenticate(AuthenticateRequestDTO(email: email, password: password));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> signUpUser({required signUpUserData}) async {
    try {
      await _authDataSource.register(RegisterRequestDTO.fromUserData(signUpUserData));
    } catch (e) {
      rethrow;
    }
  }
}
