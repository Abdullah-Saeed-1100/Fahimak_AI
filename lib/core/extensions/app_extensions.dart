import 'package:flutter/material.dart';

extension ContextExt on BuildContext {
  // get is dark mode
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;

  //   // get device size
  //   double get deviceHeight => MediaQuery.sizeOf(this).height;
  //   double get deviceWidth => MediaQuery.sizeOf(this).width;

  //   // check device type
  //   bool get isMobile => MediaQuery.sizeOf(this).width <= 600;
  //   bool get isTablet =>
  //       MediaQuery.sizeOf(this).width > 600 &&
  //       MediaQuery.sizeOf(this).width <= 1200;
  //   bool get isDesktop => MediaQuery.sizeOf(this).width > 1200;
}
