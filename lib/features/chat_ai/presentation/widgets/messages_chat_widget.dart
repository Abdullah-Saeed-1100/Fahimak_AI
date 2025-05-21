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
    debugPrint("========= >> [ rebuild MessagesChatWidget ] << =========");
    final messagesChatState = context.select(
      (ChatCubit cubit) => cubit.state.messages,
    ); // تحديث القائمة بعد أي عملية فيها

    // لو القائمة فارغة
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
    // لو القائمة لا فارغة
    return ListView.builder(
      controller: context.read<ChatCubit>().scrollController,
      itemCount: messagesChatState.length,
      reverse: true, // اعكس التمرير
      itemBuilder: (context, index) {
        // عكس الفهرس حتى نُظهر آخر رسالة أولاً
        final message = messagesChatState[messagesChatState.length - 1 - index];

        // إذا كان هذا هو index == 0 فنحن في آخر رسالة مضافة (الأحدث)
        // عندها نعرض الرسالة الأخيرة + ويدجت التحميل
        if (index == 0) {
          return Column(
            children: [
              MessageBubble(message: message),
              LoadingResponseMessageWidget(message: message),
            ],
          );
        }

        // خلاف ذلك، نعرض الرسائل فقط
        return MessageBubble(message: message);
      },
    );
  }
}
