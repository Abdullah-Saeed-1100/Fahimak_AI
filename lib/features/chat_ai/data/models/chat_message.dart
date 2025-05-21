import 'package:hive/hive.dart';
part 'chat_message.g.dart';

@HiveType(typeId: 0)
class ChatMessage extends HiveObject {
  @HiveField(0)
  final String text;
  @HiveField(1)
  final DateTime timestamp;
  @HiveField(2)
  final MessageType type;

  ChatMessage({
    required this.text,
    required this.timestamp,
    required this.type,
  });
}

@HiveType(typeId: 1)
enum MessageType {
  @HiveField(0)
  incoming,

  @HiveField(1)
  outgoing,
}
