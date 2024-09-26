import 'package:flutter/material.dart';
import 'package:first_app/ui/screens/counter_screen.dart';

void main() {
  runApp(const Root());
}

class Root extends StatelessWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Counter()
    );
  }
}
