abstract class IPreferencesRepository {
  Future<void> delete<T extends Object>();
  Future<T?> read<T extends Object>({required Function fromJsonCallback});
  Future<void> write<T extends Object>({required Function toJsonCallback});

  // Future<T?> read<T extends Object>();
  // Future<void> write<T extends Object>(T val);

  // Future<Token?> readToken();
  // Future<void> writeToken(Token val);
  // Future<void> deleteToken();

  // Future<Credentials?> readCredentials();
  // Future<void> writeCredentials(Credentials val);
  // Future<void> deleteCredentials();
}
