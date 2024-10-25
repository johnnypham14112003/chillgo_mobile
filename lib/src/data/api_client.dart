import 'dart:convert';

import 'package:chillgo_mobile/src/core/utils/constants.dart';
import 'package:http/http.dart' as http;

final ApiClient apiClient = ApiClient();

class ApiClient {
  late String baseUrl;
  late Map<String, String> defaultHeaders;

  static final ApiClient _instance = ApiClient._();
  factory ApiClient() {
    _instance.baseUrl = apiServerUrl;
    _instance.defaultHeaders = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return _instance;
  }
  ApiClient._();

  void setToken(String token) {
    defaultHeaders['Authorization'] = 'Bearer $token';
  }

  Future<dynamic> get(
    String path, {
    Map<String, String>? headers,
    Map<String, String>? params,
  }) async {
    try {
      final url = Uri.parse('$baseUrl/$path');
      final res = await http.get(
        url,
        headers: {...defaultHeaders, ...?headers},
      );

      // status code >= 400: error
      if (res.statusCode >= 400) {
        throw Exception(jsonDecode(res.body));
      }

      return jsonDecode(res.body);
    } on Exception {
      rethrow;
    }
  }

  Future<dynamic> post(
    String path, {
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse('$baseUrl/$path');
    final res = await http.post(
      url,
      headers: {...defaultHeaders, ...?headers},
      body: jsonEncode(body),
    );

    // status code >= 400: error
    if (res.statusCode >= 400) {
      throw FormatException(jsonDecode(res.body)['message']);
    }

    return jsonDecode(res.body);
  }

  Future<dynamic> put(
    String path, {
    Map<String, String>? headers,
    Map<String, String>? params,
    Map<String, dynamic>? body,
  }) async {
    final url = Uri.parse('$baseUrl/$path');
    final res = await http.put(
      url,
      headers: {...defaultHeaders, ...?headers},
      body: jsonEncode(body),
    );

    // status code >= 400: error
    if (res.statusCode >= 400) {
      throw Exception(jsonDecode(res.body));
    }

    return jsonDecode(res.body);
  }

  Future<dynamic> delete(
    String path, {
    Map<String, String>? headers,
    Map<String, String>? params,
  }) async {
    final url = Uri.parse('$baseUrl/$path');
    final res = await http.delete(
      url,
      headers: {...defaultHeaders, ...?headers},
    );

    // status code >= 400: error
    if (res.statusCode >= 400) {
      throw Exception(jsonDecode(res.body));
    }

    return jsonDecode(res.body);
  }

  Future<dynamic> upFile(
    String path, {
    required String filePath,
    required Map<String, String> body,
  }) async {
    final url = Uri.parse('$baseUrl/$path');
    var request = http.MultipartRequest('POST', url);
    request.fields.addAll(body);
    request.headers.addAll(defaultHeaders);
    request.files.add(await http.MultipartFile.fromPath('File', filePath));

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final source = await response.stream.bytesToString();
      return jsonDecode(source);
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }
}
