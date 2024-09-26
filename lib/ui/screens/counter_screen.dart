import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../colors/global_colors.dart';
import '../widgets/button.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _Counter();
}

class _Counter extends State<Counter> {
  final GlobalKey key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('BookFlix',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.0,
                ))),
        body: Center(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
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
          const SizedBox(height: 40.0),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Button(
                text: 'Hello',
                callback: () {
                  print('Helloooo');
                }),
            const SizedBox(width: 15.0),
            Container(
                height: 55.0,
                width: 55.0,
                padding: const EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                    color: CustomColors.whiteGray,
                    borderRadius: BorderRadius.circular(15.0)),
                child: SvgPicture.asset('assets/img/google.svg',
                    height: 30.0, width: 30.0)),
            const SizedBox(width: 10.0),
            Container(
                height: 55.0,
                width: 55.0,
                padding: const EdgeInsets.all(13.0),
                decoration: BoxDecoration(
                    color: CustomColors.whiteGray,
                    borderRadius: BorderRadius.circular(15.0)),
                child: SvgPicture.asset('assets/img/apple.svg',
                    height: 30.0, width: 30.0)),
          ]),
          const SizedBox(height: 15.0),
          RichText(
              text: const TextSpan(children: [
            TextSpan(
                text: 'Do you already have an acount?',
                style: TextStyle(
                    color: CustomColors.gray, fontWeight: FontWeight.bold)),
            TextSpan(
                text: ' Login',
                style: TextStyle(
                    color: CustomColors.red, fontWeight: FontWeight.bold)),
          ]))
        ])));
  }
}
