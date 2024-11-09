import 'package:chillgo_mobile/src/models/ai_message.dart';

final class Message {
  final String id;
  final String message;
  AIMessage? aiMessage;
  final String sender;
  final DateTime time;
   String? textTest;

  Message(
      {required this.message,
      required this.sender,
      required this.time,
      this.aiMessage,this.textTest})
      : id = '';

  Message.fromMap(this.id, Map<String, dynamic> map)
      : message = map['message'] ?? '',
        sender = map['sender'],
        time = map['time'];

  Map<String, dynamic> toMap() =>
      {'message': message, 'sender': sender, 'time': time};
}
