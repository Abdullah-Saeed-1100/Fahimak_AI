import 'package:flutter/material.dart';

class AppShadows {
  const AppShadows._();

  static BoxShadow shadow1 = BoxShadow(
    color: Colors.black.withAlpha(25),
    blurRadius: 12,
    offset: const Offset(0, 4),
  );
}
