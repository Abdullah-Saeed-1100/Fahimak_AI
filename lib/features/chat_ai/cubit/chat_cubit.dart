import 'dart:async';

import 'package:fahimak_ai/features/chat_ai/cubit/chat_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/chat_message.dart'; // For Future.delayed

// Dummy data (can be moved to a separate file if preferred)
final List<ChatMessage> dummyMessages = [
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

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatState(messages: dummyMessages));

  void sendMessage(String text) {
    if (text.trim().isEmpty) {
      return;
    }
    final newMessage = ChatMessage(
      text: text,
      timestamp: DateTime.now(),
      type: MessageType.outgoing,
    );
    emit(ChatState(messages: [...state.messages, newMessage]));
  }

  void addDummyReply() {
    // Future.delayed(const Duration(seconds: 1), () {
    //   // Simulated delay
    //   final reply = ChatMessage(
    //     text: 'This is a dummy reply.',
    //     timestamp: DateTime.now(),
    //     type: MessageType.incoming,
    //   );
    //   emit(ChatState(messages: [...state.messages, reply]));
    // });
    final reply = ChatMessage(
      text: 'This is a dummy reply.',
      timestamp: DateTime.now(),
      type: MessageType.incoming,
    );
    emit(ChatState(messages: [...state.messages, reply]));
  }
}
