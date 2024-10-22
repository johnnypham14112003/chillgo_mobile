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

  Future logout() async {}
}
