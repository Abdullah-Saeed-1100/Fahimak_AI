import 'package:fahimak_ai/core/extensions/app_extensions.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../core/utils/app_images.dart';
import '../../data/models/chat_message.dart';

class MessageBubble extends StatelessWidget {
  /// The message data to display.
  final ChatMessage message;
  final bool isLoading;

  const MessageBubble({
    super.key,
    required this.message,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final isOutgoing = message.type == MessageType.outgoing;
    return Align(
      alignment: isOutgoing ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 4.0,
        ).copyWith(left: isOutgoing ? 24.0 : 8, right: isOutgoing ? 8 : 24.0),
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color:
              isOutgoing ? context.theme.primaryColor : context.theme.cardColor,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(12.0),
            bottomRight: Radius.circular(12.0),
            topLeft: isOutgoing ? Radius.circular(12.0) : Radius.circular(0),
            topRight: isOutgoing ? Radius.circular(0) : Radius.circular(12.0),
          ),
        ),
        child:
            isLoading
                ? Lottie.asset(
                  AppImages.loadingAnimation,
                  height: 35,
                  width: 35,
                )
                : SelectableText(
                  message.text,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.justify,
                  style: context.theme.textTheme.bodyMedium?.copyWith(
                    color:
                        isOutgoing
                            ? null
                            : context.isDarkMode
                            ? Colors.white
                            : Colors.black,
                  ),
                ),
      ),
    );
  }
}
