import 'package:fahimak_ai/core/helper_functions/custom_show_dialog.dart';
import 'package:fahimak_ai/core/helper_functions/custom_snack_bar.dart';
import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:fahimak_ai/features/chat_ai/presentation/cubit/chat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ClearChatMessagesWidget extends StatelessWidget {
  const ClearChatMessagesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final confirmed = await customShowDialog(
          context: context,
          content:
              "هل أنت متأكد أنك تريد حذف جميع رسائل الدردشة؟ لا يمكن التراجع عن هذا الإجراء.",
        );

        if (confirmed == true) {
          if (!context.mounted) return;
          await context.read<ChatCubit>().clearMessages(); // clear messages
          if (!context.mounted) return;
          customSnackBar(
            context: context,
            message: "تم مسح جميع رسائل الدردشة بنجاح.",
          );
        }
      },
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(12),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Row(
          children: [
            Expanded(
              child: Text(
                "مسح محتوى الدردشة",
                style: Theme.of(context).primaryTextTheme.labelMedium,
              ),
            ),
            SvgPicture.asset(
              AppImages.delete,
              height: 20,
              colorFilter: ColorFilter.mode(
                Theme.of(context).primaryTextTheme.labelMedium?.color ??
                    Colors.black,
                BlendMode.srcIn,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
