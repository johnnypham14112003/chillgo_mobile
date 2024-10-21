import 'package:chillgo_mobile/src/data/api_client.dart';

class AuthRepository {
  final _apiClient = ApiClient();
  Future login(String email, String password) async {
    final response = await _apiClient.post('/login', body: {
      'email': email,
      'password': password,
    });
    return response;
  }

  Future register(String fullname, String email, String password) async {
    final response = await _apiClient.post('/register', headers: {
      // 'Content-Type': 'application/json',
      // "ngrok-skip-browser-warning": "1"
    }, body: {
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
