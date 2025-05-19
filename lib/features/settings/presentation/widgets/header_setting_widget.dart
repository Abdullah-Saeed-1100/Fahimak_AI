import 'package:fahimak_ai/core/extensions/app_extensions.dart';
import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderSettingWidget extends StatelessWidget {
  final String text;
  const HeaderSettingWidget({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
        child: Row(
          textDirection: TextDirection.rtl,
          children: [
            SvgPicture.asset(AppImages.generate),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                text,
                textDirection: TextDirection.rtl,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
