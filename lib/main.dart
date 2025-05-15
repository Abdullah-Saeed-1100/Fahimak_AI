import 'package:fahimak_ai/on_boarding/widgets/on_boarding_view_body.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FahimakAi());
}

class FahimakAi extends StatelessWidget {
  const FahimakAi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fahimak AI -- dev.Abdullah Saeed Bagar',
      debugShowCheckedModeBanner: false,
      home: const OnBoardingViewBody(),
    );
  }
}
