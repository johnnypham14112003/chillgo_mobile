import 'package:chillgo_mobile/src/data/repositories/chat_repository.dart';
import 'package:chillgo_mobile/src/models/chat.dart';
import 'package:chillgo_mobile/src/models/chat_ai_package.dart';
import 'package:flutter/material.dart';

class ChatAiProvider extends ChangeNotifier {
  List<Message> get messages => _messages;
  final List<Message> _messages = [];

  List<ChatAiPackage> get chatAiPackages => _chatAiPackages;
  List<ChatAiPackage> _chatAiPackages = [];

  final _repository = ChatRepository();

  ChatAiProvider() {
    getChatAIPackage().whenComplete(() {
      if (_chatAiPackages.isEmpty) {
        return;
      }

      _messages.add(
        Message(
          sender: 'chillgo',
          message: 'loading',
          time: DateTime.now(),
        ),
      );
      notifyListeners();
      Future.delayed(Durations.extralong1, () {
        _messages.removeLast();
        _messages.add(
          Message(
            sender: 'chillgo',
            message: 'Xin chào, hôm nay bạn có dự định đi đâu chơi chưa?',
            time: DateTime.now(),
          ),
        );
        notifyListeners();
      });
    });
  }
  void sendMessage(Message message) {
    _messages.add(message);
    notifyListeners();
  }

  chatGenerate(String value) async {
    _messages.add(
      Message(
        sender: 'chillgo',
        message: 'loading',
        time: DateTime.now(),
      ),
    );
    notifyListeners();
    final content = await _repository.sendMessage(value);
    // final x = AIMessage.fromJson(content);
    // await Future.delayed(Durations.extralong4);
    _messages.removeLast();
    // final aiMsg = AIMessage.fromJson(messageExample);
    _messages.add(
      Message(
        sender: 'chillgo',
        message: 'Sau đây là một thông tin, bài viết về du lịch trải nghiệm',
        // aiMessage: aiMsg,
        textTest: content,
        time: DateTime.now(),
      ),
    );
    notifyListeners();
  }

  Future<void> getChatAIPackage() async {
    _chatAiPackages = await _repository.getChatAIPackage();
    _chatAiPackages.sort((a, b) => a.duration.compareTo(b.duration));
    notifyListeners();
  }
}
