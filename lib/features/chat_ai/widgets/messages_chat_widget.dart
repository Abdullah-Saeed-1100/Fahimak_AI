import 'package:fahimak_ai/features/chat_ai/cubit/chat_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../core/utils/app_images.dart';
import '../../settings/widgets/header_setting_widget.dart';

class MessagesChatWidget extends StatelessWidget {
  const MessagesChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesChatState = context.select(
      (ChatCubit cubit) => cubit.state.messages,
    );
    debugPrint("========= >> [ rebuild MessagesChatWidget ] << =========");

    return messagesChatState.isEmpty
        ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.aiRobotSmall, height: 150),
            HeaderSettingWidget(
              text:
                  "يمكنك الآن بدء الدردشة من هنا 🗨️...\n أن جاهز لتقديم أقصى ما لدي لمساعدتك 🫡...",
              backgroundColor: Colors.white,
            ),
          ],
        )
        : ListView.builder(
          controller: context.read<ChatCubit>().scrollController,
          itemCount: messagesChatState.length,
          itemBuilder: (context, index) {
            final message = messagesChatState[index];
            return index == 0
                ? Column(
                  children: [
                    SvgPicture.asset(AppImages.aiRobotSmall, height: 150),
                    HeaderSettingWidget(
                      text:
                          " لو تبغاني أعطيك نتائج أكثر دقة تناسب ماتحتاجة, قم بالذهاب لصفحة الإعداات وقم بتخصيص إعدادات المحادثة لتناسب ماتريد...",
                      // backgroundColor: Colors.white,
                    ),
                  ],
                )
                : MessageBubble(message: message);
          },
        );
  }
}
