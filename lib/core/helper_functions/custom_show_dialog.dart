import 'package:flutter/material.dart';

Future<bool?> customShowDialog({
  required BuildContext context,
  required String content,
}) {
  return showDialog<bool>(
    context: context,
    builder:
        (context) => AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Row(
            children: [
              Icon(Icons.warning_amber_rounded, color: Colors.red, size: 26),
              const SizedBox(width: 8),
              Text(
                "رسالة تأكيد",
                style: Theme.of(context).primaryTextTheme.labelLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            content,
            style: Theme.of(context).primaryTextTheme.labelMedium,
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, false),
              child: Text(
                "إلغاء",
                style: Theme.of(context).primaryTextTheme.labelSmall,
              ),
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              // icon: const Icon(Icons.delete_forever),
              label: const Text("مسح الكل"),
              onPressed: () => Navigator.pop(context, true),
            ),
          ],
        ),
  );
}
