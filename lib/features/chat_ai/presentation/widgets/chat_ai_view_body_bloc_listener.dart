import 'package:fahimak_ai/core/helper_functions/custom_snack_bar.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_state.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/gemini_state.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/widgets/chat_ai_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAiViewBodyBlocListener extends StatelessWidget {
  const ChatAiViewBodyBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ChatCubit, ChatState>(
      listenWhen: (previous, current) {
        // ينفذ فقط إذا تغيرت القيمة من أي شيء إلى GeminiFailure
        return current.geminiStatus is GeminiFailure &&
            previous.geminiStatus != current.geminiStatus;
      },
      listener: (context, state) {
        if (state.geminiStatus is GeminiFailure) {
          customSnackBar(
            context: context,
            message: (state.geminiStatus as GeminiFailure).errMessage,
          );
        }
      },
      child: const ChatAiViewBody(),
    );
  }
}
