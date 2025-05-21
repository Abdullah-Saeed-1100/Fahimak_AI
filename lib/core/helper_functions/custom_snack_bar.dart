import 'package:flutter/material.dart';

void customSnackBar({
  required BuildContext context,
  required String message,
  Duration duration = const Duration(seconds: 1),
}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message, textAlign: TextAlign.right),
      duration: duration,
      // behavior: SnackBarBehavior.floating,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      // margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    ),
  );
}
