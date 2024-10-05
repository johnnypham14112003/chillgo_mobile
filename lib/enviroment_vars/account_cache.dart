import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';
import 'package:chillgo_mobile/models/account_model.dart';

class AccountProvider with ChangeNotifier {
  SharedPreferences? _prefs;
  Account? _account;

  static const String _keyAccount = 'account';

  Account? get account => _account;

  Future<void> initialize() async {
    _prefs = await SharedPreferences.getInstance();
    await loadAccount();
  }

  Future<void> saveAccount(Account account) async {
    _account = account;
    final accountJson = json.encode(account.toJson());
    await _prefs?.setString(_keyAccount, accountJson);
    notifyListeners();
  }

  Future<void> loadAccount() async {
    final accountJson = _prefs?.getString(_keyAccount);
    if (accountJson != null) {
      _account = Account.fromJson(json.decode(accountJson));
      notifyListeners();
    }
  }

  Future<void> clearAccount() async {
    _account = null;
    await _prefs?.remove(_keyAccount);
    notifyListeners();
  }
}