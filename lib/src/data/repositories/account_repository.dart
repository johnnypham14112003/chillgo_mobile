import 'package:chillgo_mobile/src/models/account_model.dart';
import 'package:chillgo_mobile/src/models/transaction.dart';

import '../api_client.dart';

class AccountRepository {
  //singleton
  static final AccountRepository _instance = AccountRepository._();
  factory AccountRepository() {
    return _instance;
  }
  AccountRepository._();

  final path = 'accounts';

  Future<Account> getAccount(String id) async {
    final response = await apiClient.get('$path/$id');
    return Account.fromJson(response);
  }

  Future updateAccount(Account account) async {
    final response = await apiClient.patch(
      '$path/updating',
      body: account.toJsonForUpdate(),
    );
    return response;
  }

  Future updatePassword(
      Account account, String oldPassword, String newPassword) async {
    final response = await apiClient.patch(
      '$path/new-password',
      body: {
        "target-account-id": account.id,
        "email": account.email,
        "password": oldPassword,
        "new-password": newPassword,
        "role": account.role,
      },
    );
    return response;
  }

  Future<Map<String, dynamic>?> updateAvatar(
      String filePath, String accountId) async {
    final response = await apiClient.upFile('image', filePath: filePath, body: {
      'FileName': accountId,
      'IsAvatar': 'true',
      'Type': '1',
      'Status': 'Đã Tải Lên',
      'AccountId': accountId,
      'LocationId': ''
    });

    return response;
  }

  Future<List<Transaction>> getPackageTransaction(String id) async {
    final response = await apiClient.get('package-transaction/by-user/$id');
    final transactions = (response as List)
        .map((element) => Transaction.fromMap(element))
        .toList();
    return transactions;
  }

  Future<String> getAvatar(String name) async {
    final response = await apiClient.get('image/${name}_1');
    return response['image-url'];
  }
}
