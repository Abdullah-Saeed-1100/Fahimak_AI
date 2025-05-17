import 'package:fahimak_ai/features/chat_ai/cubit/chat_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/widgets/chat_ai_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatAiView extends StatelessWidget {
  const ChatAiView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(),
      child: Scaffold(body: const ChatAiViewBody()),
    );
  }
}
