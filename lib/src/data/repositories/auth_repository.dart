import '../api_client.dart';

class AuthRepository {
  //singleton
  static final AuthRepository _instance = AuthRepository._();
  factory AuthRepository() {
    return _instance;
  }
  AuthRepository._();

  final path = '/accounts';
  Future login(String email, String password) async {
    final response = await apiClient.post('$path/login', body: {
      'email': email,
      'password': password,
    });
    return response;
  }

  Future register(String fullname, String email, String password) async {
    final response = await apiClient.post('$path/register', body: {
      'full-name': fullname,
      'email': email,
      'password': password,
    });
    return response;
  }

  Future getAccount() async {}

  Future updateAccount(String email, String password) async {}
  Future<bool> updateAvatar(
      String filePath, String accountId, String name) async {
    final response = await apiClient.upFile('image', filePath: filePath, body: {
      'FileName': name,
      'IsAvatar': 'true',
      'Type': '1',
      'Status': 'Đã Tải Lên',
      'AccountId': accountId,
      'LocationId': ''
    });

    return response;
  }

  Future logout() async {}
}
