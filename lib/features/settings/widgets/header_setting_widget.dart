import 'package:fahimak_ai/core/utils/app_colors.dart';
import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HeaderSettingWidget extends StatelessWidget {
  final String text;
  final Color? backgroundColor;
  const HeaderSettingWidget({
    super.key,
    required this.text,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor ?? AppColors.primary15,
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
