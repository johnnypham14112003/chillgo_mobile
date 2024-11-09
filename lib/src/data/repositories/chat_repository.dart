import 'dart:convert';

import 'package:chillgo_mobile/src/data/api_client.dart';
import 'package:chillgo_mobile/src/models/chat_ai_package.dart';
import 'package:http/http.dart' as http;

class ChatRepository {
  ChatRepository._private();
  static final _instance = ChatRepository._private();
  factory ChatRepository() => _instance;

  Future<dynamic> sendMessage(String message) async {
    final url = Uri.parse('https://api.openai.com/v1/chat/completions');
    var headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Authorization':
          'Bearer nhập token vô đây nhé', // sk-proj-MmXMFPSTalHba1...JOvfKdaNYA
      'Cookie':
          '__cf_bm=nnOhY2sFtAeQvYSiovGyyQ0dI_pbBpImzZrC51hhEG4-1730192333-1.0.1.1-158HAFOyRVxEnGQQjwpd7ZAWeCrDWk1HBcZPphcVAH66fJhcD6fIm7RCDYZFL.hngOt8G1iHuuLitTHuiqHUkQ; _cfuvid=W0fMk2bSUHU3nAAHVJGIvBKD9s2ssxT.hw1NS57Uadg-1730192333899-0.0.1.1-604800000'
    };

    final body = jsonEncode({
      "model": "ft:gpt-4o-mini-2024-07-18:chillgo:dataflow:AMyv5VgK",
      "messages": [
        {
          "role": "system",
          "content": [
            {
              "type": "text",
              "text":
                  "You are a friendly, enthusiastic travel assistant that provides accurate travel information with a touch of humor and fun. You prioritizes providing travel information about history and historical sites, helping visitors not only learn but also love each destination. Answer in Vietnamese"
            }
          ]
        },
        {
          "role": "user",
          "content": [
            {"type": "text", "text": message}
          ]
        }
      ],
      "temperature": 0.8,
      "max_tokens": 16383,
      "top_p": 1,
      "frequency_penalty": 0,
      "presence_penalty": 0,
      "response_format": {"type": "text"}
    });

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body)['choices'] as List;
      if (data.isNotEmpty) {
        final newData = utf8.decode(response.bodyBytes);
        final message = jsonDecode(newData)['choices'][0]['message']['content'];
        return message;
      }
    } else {
      print(response.reasonPhrase);
      return null;
    }
  }

  Future<List<ChatAiPackage>> getChatAIPackage() async {
    final response = await apiClient.get('package/list');
    final data = response['data-list'];
    final packages =
        (data as List).map((e) => ChatAiPackage.fromMap(e)).toList();
    return packages;
  }
}
