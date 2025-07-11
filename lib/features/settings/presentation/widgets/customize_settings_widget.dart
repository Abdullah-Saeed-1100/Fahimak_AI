import 'package:fahimak_ai/core/extensions/app_extensions.dart';
import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeSettingsWidget extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;
  const CustomizeSettingsWidget({
    super.key,
    required this.title,
    required this.children,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: context.theme.cardColor,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SvgPicture.asset(AppImages.generate),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: Theme.of(context).primaryTextTheme.labelMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Wrap(
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: children,
            ),
            SizedBox(height: 12),
            if (subtitle != null)
              Text(
                subtitle!,
                style: Theme.of(context).primaryTextTheme.labelSmall,
              ),
          ],
        ),
      ),
    );
  }
}
