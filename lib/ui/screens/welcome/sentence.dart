import 'package:flutter/material.dart';
import '../../colors/global_colors.dart';

class Sentence extends StatelessWidget {
  const Sentence({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      RichText(
          text: const TextSpan(children: [
        TextSpan(
            text: 'Your',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: Colors.black)),
        TextSpan(
            text: ' Preferences',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
                color: CustomColors.red))
      ])),
      const Text('In only one place',
          style: TextStyle(
              color: Colors.black,
              fontSize: 40.0,
              fontWeight: FontWeight.bold)),
      const Text('Find what your tastes are',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: CustomColors.gray)),
      const Text('Looking for',
          style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: CustomColors.gray)),
    ]);
  }
}
