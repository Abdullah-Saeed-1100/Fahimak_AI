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
      home: const Scaffold(body: Center(child: Text('Fahimak AI'))),
    );
  }
}
