import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:chillgo_mobile/enviroment_vars/constants.dart'; //apiServerUrl

class AccountService {
  static const String baseUrl = '$apiServerUrl/accounts';

  //======================[ METHODS ]======================
  Future<http.Response> fetchRegister(
      String fullname, String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/register'),
        headers: {
          'Content-Type': 'application/json',
          "ngrok-skip-browser-warning": "1"
        },
        body: jsonEncode({
          'full-name': fullname,
          'email': email,
          'password': password,
        }));
    return response;
  }

  Future<http.Response> fetchLogin(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          'ngrok-skip-browser-warning': '1'
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    return response;
  }

  Future<http.Response> searchAccount(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          "ngrok-skip-browser-warning": "1"
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    return response;
  }

  Future<http.Response> updateAccount(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          "ngrok-skip-browser-warning": "1"
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    return response;
  }

  Future<http.Response> deleteAccount(String email, String password) async {
    final response = await http.post(Uri.parse('$baseUrl/login'),
        headers: {
          'Content-Type': 'application/json',
          "ngrok-skip-browser-warning": "1"
        },
        body: jsonEncode({
          'email': email,
          'password': password,
        }));
    return response;
  }
}
