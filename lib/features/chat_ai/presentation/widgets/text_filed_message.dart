import 'package:fahimak_ai/core/extensions/app_extensions.dart';
import 'package:fahimak_ai/core/utils/app_shadows.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TextFiledMessage extends StatelessWidget {
  const TextFiledMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        boxShadow: [AppShadows.shadow1],
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: context.read<ChatCubit>().textController,
        minLines: 1,
        maxLines: 5,
        // keyboardType: TextInputType.text,
        textInputAction: TextInputAction.newline,
        style: context.theme.primaryTextTheme.labelMedium,
        decoration: const InputDecoration(hintText: "أكتب سؤالك هنا ..."),
        cursorHeight: 25,
        cursorRadius: Radius.circular(50),
        cursorColor: context.theme.primaryColor,
        cursorWidth: 1,
        cursorOpacityAnimates: true,
      ),
    );
  }
}
