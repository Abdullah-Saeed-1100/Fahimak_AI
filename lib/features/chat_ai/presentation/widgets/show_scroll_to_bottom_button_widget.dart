import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShowScrollToBottomButtonWidget extends StatelessWidget {
  const ShowScrollToBottomButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final showScrollToBottomButtonState = context.select(
      (ChatCubit cubit) => cubit.state.showScrollToBottomButton,
    );
    debugPrint(
      "========= >> [ rebuild ShowScrollToBottomButtonWidget ] << =========",
    );

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedOpacity(
        opacity: showScrollToBottomButtonState ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 300),
        child: IconButton(
          icon: const Icon(Icons.arrow_downward),
          onPressed: () => context.read<ChatCubit>().scrollToBottom(),
        ),
      ),
    );
  }
}
