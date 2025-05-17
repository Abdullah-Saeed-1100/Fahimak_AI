import 'package:fahimak_ai/core/extensions/app_extensions.dart';
import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/core/utils/app_text_styles.dart';
import 'package:fahimak_ai/features/chat_ai/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/utils/app_shadows.dart';

class SendMessageControl extends StatelessWidget {
  const SendMessageControl({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        textDirection: TextDirection.rtl,
        children: [
          Expanded(
            child: DecoratedBox(
              decoration: BoxDecoration(
                boxShadow: [AppShadows.shadow1],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: context.read<ChatCubit>().textController,
                minLines: 1,
                maxLines: 5,
                keyboardType: TextInputType.text,
                textDirection: TextDirection.rtl,
                decoration: const InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText: "أكتب سؤالك هنا ...",
                  hintTextDirection: TextDirection.rtl,
                  hintStyle: AppTextStyles.body14,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 16.0,
                    horizontal: 16.0,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  ),
                ),
                cursorHeight: 25,
                cursorRadius: Radius.circular(50),
                cursorColor: context.theme.primaryColor,
                cursorWidth: 1,
                cursorOpacityAnimates: true,
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          GestureDetector(
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
          ),
        ],
      ),
    );
  }
}
