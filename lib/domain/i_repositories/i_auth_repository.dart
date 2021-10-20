import '../models/auth/sign_up_user_data.dart';

abstract class IAuthRepository {
  Future<void> authenticate({
    required String email,
    required String password,
  });

  Future<void> signUpUser({
    required SignUpUserData signUpUserData,
  });
}
