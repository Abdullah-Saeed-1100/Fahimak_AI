import 'package:fahimak_ai/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomizeSettingsWidget extends StatelessWidget {
  final String title;
  final List<Widget> children;
  const CustomizeSettingsWidget({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),

      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 12),
        child: Column(
          textDirection: TextDirection.rtl,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              textDirection: TextDirection.rtl,
              children: [
                SvgPicture.asset(AppImages.generate),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    textDirection: TextDirection.rtl,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Wrap(
              textDirection: TextDirection.rtl,
              alignment: WrapAlignment.start,
              spacing: 8,
              runSpacing: 8,
              children: children,
            ),
          ],
        ),
      ),
    );
  }
}
