import 'package:chillgo_mobile/src/data/api_client.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:chillgo_mobile/src/models/account_model.dart';

class AccountProvider with ChangeNotifier {
  SharedPreferences? _prefs;
  Account? _account;

  static const String _keyAccount = 'account';
  static const String _keyAccessToken = 'accessToken';

  Account? get account => _account;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadAccount();
  }

  Future<void> saveAccount(Account account, String accessToken) async {
    _account = account;
    final accountJson = json.encode(account.toJson());
    await _prefs?.setString(_keyAccount, accountJson);
    await _prefs?.setString(_keyAccessToken, accessToken);
    apiClient.setToken(accessToken);
    notifyListeners();
  }

  Future<void> loadAccount() async {
    final accountJson = _prefs?.getString(_keyAccount);
    final accessToken = _prefs?.getString(_keyAccessToken);
    if (accountJson != null && accessToken != null) {
      _account = Account.fromJson(json.decode(accountJson));
      apiClient.setToken(accessToken);
      notifyListeners();
    }
  }

  Future<void> clearAccount() async {
    _account = null;
    await _prefs?.remove(_keyAccount);
    notifyListeners();
  }
}
