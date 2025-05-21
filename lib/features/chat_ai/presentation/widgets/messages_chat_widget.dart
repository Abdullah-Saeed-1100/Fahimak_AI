import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_cubit.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/widgets/loading_response_message_widget.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/widgets/message_bubble.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_images.dart';
import '../../../settings/presentation/widgets/header_setting_widget.dart';

class MessagesChatWidget extends StatelessWidget {
  const MessagesChatWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final messagesChatState = context.select(
      (ChatCubit cubit) => cubit.state.messages,
    );
    debugPrint("========= >> [ rebuild MessagesChatWidget ] << =========");
    // هذا الكود يضمن تنفيذ scrollToBottom بعد رسم الرسائل فعليًا
    // WidgetsBinding.instance.addPostFrameCallback((_) {
    //   context.read<ChatCubit>().scrollToBottom();
    // });

    if (messagesChatState.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SvgPicture.asset(AppImages.aiRobotSmall, height: 150),
            HeaderSettingWidget(
              text:
                  "يمكنك الآن بدء الدردشة من هنا 🗨️...\n أنا جاهز لتقديم أقصى ما لدي لمساعدتك 🫡...",
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      controller: context.read<ChatCubit>().scrollController,
      itemCount: messagesChatState.length,
      itemBuilder: (context, index) {
        final message = messagesChatState[index];
        return
        // index == 0
        //     ? Column(
        //       children: [
        //         SvgPicture.asset(AppImages.aiRobotSmall, height: 150),
        //         HeaderSettingWidget(
        //           text:
        //               " لو تبغاني أعطيك نتائج أكثر دقة تناسب ماتحتاجة, قم بالذهاب لصفحة الإعدادات وقم بتخصيص إعدادات المحادثة لتناسب ماتريد...",
        //         ),
        //       ],
        //     )
        //     :
        index != messagesChatState.length - 1
            ? MessageBubble(message: message)
            : Column(
              children: [
                MessageBubble(message: message),
                // loading response
                LoadingResponseMessageWidget(message: message),
              ],
            );
      },
    );
  }
}
