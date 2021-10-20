import '../core/rest_client.dart';

import '../exceptions/api_exception.dart';
import '../mappers/auth/authenticate_request_dto.dart';
import '../mappers/auth/authenticate_response_dto.dart';
import '../mappers/auth/forgot_password_request_dto.dart';
import '../mappers/auth/register_request_dto.dart';
import '../mappers/auth/reset_password_request_dto.dart';
import '../mappers/auth/revoke_token_request_dto.dart';
import '../mappers/auth/validate_reset_token_request_dto.dart';
import '../mappers/auth/verify_email_request_dto.dart';

abstract class IAuthDataSource {
  Future<AuthenticateResponseDTO> authenticate(AuthenticateRequestDTO request);
  Future<AuthenticateResponseDTO> refreshToken();
  Future<void> revokeToken(RevokeTokenRequestDTO request);
  Future<void> register(RegisterRequestDTO request);
  Future<void> verifyEmail(VerifyEmailRequestDTO request);
  Future<void> forgotPassword(ForgotPasswordRequestDTO request);
  Future<void> validateResetToken(ValidateResetTokenRequestDTO request);
  Future<void> resetPassword(ResetPasswordRequestDTO request);
}

class AuthDataSource extends IAuthDataSource {
  AuthDataSource(this._apiClient);

  final IRestClient _apiClient;

  @override
  Future<AuthenticateResponseDTO> authenticate(AuthenticateRequestDTO request) async {
    try {
      var response = await _apiClient.post(
        '/accounts/authenticate',
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
      return AuthenticateResponseDTO.fromJson(response.data);
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<void> forgotPassword(ForgotPasswordRequestDTO request) async {
    try {
      final response = await _apiClient.post(
        '​/Accounts​/forgot-password',
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<AuthenticateResponseDTO> refreshToken() async {
    try {
      final response = await _apiClient.post(
        '​​/Accounts​/refresh-token',
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
      return AuthenticateResponseDTO.fromJson(response.data);
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<void> register(RegisterRequestDTO request) async {
    try {
      final response = await _apiClient.post(
        '​​​/Accounts​/register',
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<void> resetPassword(ResetPasswordRequestDTO request) async {
    try {
      final response = await _apiClient.post(
        '​​​​/Accounts​/reset-password',
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<void> revokeToken(RevokeTokenRequestDTO request) async {
    try {
      final response = await _apiClient.post(
        '​​​​​/Accounts​/revoke-token',
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<void> validateResetToken(ValidateResetTokenRequestDTO request) async {
    try {
      final response = await _apiClient.post(
        '​/Accounts​/validate-reset-token',
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<void> verifyEmail(VerifyEmailRequestDTO request) async {
    try {
      final response = await _apiClient.post(
        '​​/Accounts​/verify-email',
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }
}
