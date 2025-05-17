import 'package:fahimak_ai/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import '../models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  /// The message data to display.
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isOutgoing = message.type == MessageType.outgoing;
    return Align(
      alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: isOutgoing ? Colors.white : context.theme.primaryColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
            bottomLeft: isOutgoing ? Radius.circular(12.0) : Radius.circular(0),
            bottomRight:
                isOutgoing ? Radius.circular(0) : Radius.circular(12.0),
          ),
        ),
        child: Text(
          message.text,
          textDirection: TextDirection.rtl,
          style: TextStyle(color: isOutgoing ? Colors.black : Colors.white),
        ),
      ),
    );
  }
}
