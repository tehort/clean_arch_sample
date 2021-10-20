import '../core/rest_client.dart';

import '../exceptions/api_exception.dart';
import '../mappers/accounts/account_response_dto.dart';
import '../mappers/accounts/create_request_dto.dart';
import '../mappers/accounts/update_request_dto.dart';

abstract class IAccountsDataSource {
  Future<void> deleteById(int id);
  Future<AccountResponseDTO> get();
  Future<AccountResponseDTO> getById(int id);
  Future<AccountResponseDTO> create(CreateRequestDTO request);
  Future<AccountResponseDTO> updateById(int id, UpdateRequestDTO request);
}

class AccountsDataSource extends IAccountsDataSource {
  AccountsDataSource(this._apiClient);

  final RestClient _apiClient;

  @override
  Future<void> deleteById(int id) async {
    try {
      final response = await _apiClient.delete(
        '/Accounts​',
        queryParameters: {'id': id},
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
  Future<AccountResponseDTO> get() async {
    try {
      final response = await _apiClient.get(
        '/Accounts​',
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
      return AccountResponseDTO.fromJson(response.data);
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<AccountResponseDTO> getById(int id) async {
    try {
      final response = await _apiClient.get(
        '/Accounts​',
        queryParameters: {'id': id},
      );

      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
      return AccountResponseDTO.fromJson(response.data);
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<AccountResponseDTO> create(CreateRequestDTO request) async {
    try {
      final response = await _apiClient.post(
        '/Accounts​',
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
      return AccountResponseDTO.fromJson(response.data);
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }

  @override
  Future<AccountResponseDTO> updateById(int id, UpdateRequestDTO request) async {
    try {
      final response = await _apiClient.put(
        '/Accounts​',
        queryParameters: {'id': id},
        data: request.toJson(),
      );
      if (response.statusCode != 200) {
        throw ApiException.unexpected();
      }
      return AccountResponseDTO.fromJson(response.data);
    } on ApiException {
      rethrow;
    } on Exception {
      throw ApiException.unknown();
    }
  }
}
