import 'package:fahimak_ai/core/extensions/app_extensions.dart';
import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/features/chat_ai/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SendMessageButton extends StatelessWidget {
  const SendMessageButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.read<ChatCubit>().sendMessage(),
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.theme.primaryColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: SvgPicture.asset(AppImages.send, height: 24, width: 24),
        ),
      ),
    );
  }
}
