// Dummy data (can be moved to a separate file if preferred)
import '../data/models/chat_message.dart';

List<ChatMessage> get dummyMessages => [
  ChatMessage(
    text: 'مرحبًا!',
    timestamp: DateTime.now().subtract(Duration(minutes: 2)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: "كيف الحال؟",
    timestamp: DateTime.now().subtract(Duration(minutes: 1, seconds: 30)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: 'مرحبًا! كيف يمكنني مساعدتك؟',
    timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    type: MessageType.outgoing,
  ),
  ChatMessage(
    text: "أنا بخير، شكرًا! فقط أختبر تطبيق الدردشة هذا.",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 45)),
    type: MessageType.outgoing,
  ),
  ChatMessage(
    text: "سعيد لسماع ذلك!",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 20)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: "أخبرني إذا كان لديك أي أسئلة.",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 10)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: 'مرحبًا!',
    timestamp: DateTime.now().subtract(Duration(minutes: 2)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: "كيف الحال؟",
    timestamp: DateTime.now().subtract(Duration(minutes: 1, seconds: 30)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: 'مرحبًا! كيف يمكنني مساعدتك؟',
    timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    type: MessageType.outgoing,
  ),
  ChatMessage(
    text: "أنا بخير، شكرًا! فقط أختبر تطبيق الدردشة هذا.",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 45)),
    type: MessageType.outgoing,
  ),
  ChatMessage(
    text: "سعيد لسماع ذلك!",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 20)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: "أخبرني إذا كان لديك أي أسئلة.",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 10)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: 'مرحبًا!',
    timestamp: DateTime.now().subtract(Duration(minutes: 2)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: "كيف الحال؟",
    timestamp: DateTime.now().subtract(Duration(minutes: 1, seconds: 30)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: 'مرحبًا! كيف يمكنني مساعدتك؟',
    timestamp: DateTime.now().subtract(Duration(minutes: 1)),
    type: MessageType.outgoing,
  ),
  ChatMessage(
    text: "أنا بخير، شكرًا! فقط أختبر تطبيق الدردشة هذا.",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 45)),
    type: MessageType.outgoing,
  ),
  ChatMessage(
    text: "سعيد لسماع ذلك!",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 20)),
    type: MessageType.incoming,
  ),
  ChatMessage(
    text: "أخبرني إذا كان لديك أي أسئلة.",
    timestamp: DateTime.now().subtract(Duration(minutes: 0, seconds: 10)),
    type: MessageType.incoming,
  ),
];
