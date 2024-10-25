import '../api_client.dart';

class AccountRepository {
  //singleton
  static final AccountRepository _instance = AccountRepository._();
  factory AccountRepository() {
    return _instance;
  }
  AccountRepository._();

  final path = '/accounts';

  Future getAccount() async {}

  Future updateAccount(String email, String password) async {}
  Future<Map<String, dynamic>?> updateAvatar(
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
}
